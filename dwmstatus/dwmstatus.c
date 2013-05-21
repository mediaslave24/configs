/* made by p1c0 2013-1-23.
**
** Compile with:
** gcc -Wall -pedantic -std=c99 status.c -lX11
**
** Notes:
** bind volume keys in dwm config.h
**
** static const char *volup[] = { "dwmstatus", "volume", "up", NULL};
** static const char *voldown[] = { "dwmstatus", "volume", "down", NULL};
**
** static Key keys[] = {
**   { 0, XF86XK_AudioRaiseVolume, spawn, {.v = volup } },
**   { 0, XF86XK_AudioLowerVolume, spawn, {.v = voldown } },
**   //{ MODKEY, XK_F11, spawn, {.v = voldown } },
**   //{ MODKEY, XK_F12, spawn, {.v = volup } },
** };
*/

#define _BSD_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <strings.h>
#include <sys/time.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <X11/Xlib.h>

char *tzargentina = "America/Buenos_Aires";
char *tzutc = "UTC";
char *tzberlin = "Europe/Berlin";
char *tzla = "America/Los_Angeles";
char *tzukraine = "Europe/Kiev";

static Display *dpy;

char *
smprintf(char *fmt, ...)
{
	va_list fmtargs;
	char *ret;
	int len;

	va_start(fmtargs, fmt);
	len = vsnprintf(NULL, 0, fmt, fmtargs);
	va_end(fmtargs);

	ret = malloc(++len);
	if (ret == NULL) {
		perror("malloc");
		exit(1);
	}

	va_start(fmtargs, fmt);
	vsnprintf(ret, len, fmt, fmtargs);
	va_end(fmtargs);

	return ret;
}

void
settz(char *tzname)
{
	setenv("TZ", tzname, 1);
}

char *
mktimes(char *fmt, char *tzname)
{
	char buf[129];
	time_t tim;
	struct tm *timtm;

	memset(buf, 0, sizeof(buf));
	settz(tzname);
	tim = time(NULL);
	timtm = localtime(&tim);
	if (timtm == NULL) {
		perror("localtime");
		exit(1);
	}

	if (!strftime(buf, sizeof(buf)-1, fmt, timtm)) {
		fprintf(stderr, "strftime == 0\n");
		exit(1);
	}

	return smprintf("%s", buf);
}

void
setstatus(char *str)
{
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

char *
loadavg(void)
{
	double avgs[3];

	if (getloadavg(avgs, 3) < 0) {
		perror("getloadavg");
		exit(1);
	}

	return smprintf("%.2f %.2f %.2f", avgs[0], avgs[1], avgs[2]);
}

char*
runcmd(char* cmd) {
	FILE* fp = popen(cmd, "r");
	if (fp == NULL) return NULL;
	char ln[30];
	fgets(ln, sizeof(ln)-1, fp);
	pclose(fp);
	ln[strlen(ln)-1]='\0';
	return smprintf("%s", ln);
}

int
getvolume() {
	int volume;
        sscanf(runcmd("amixer | grep -A 6 Master | grep 'Front Left: Playback'\
			| grep -o '[0-9%]*%'"), "%i%%", &volume);
	return volume;
}
char*
getlang() {
  char *lang;
  lang = runcmd("xkb-switch");
  return lang;
}

void
setvolume(int percent) {
	char volcmd[32];
	sprintf(volcmd, "amixer set Master %i%%", percent);
	system(volcmd);
}

char*
mkprogressbar(unsigned int size, unsigned int percent) {
	unsigned int num = ((size-2)*percent)/100;
	char *bar = malloc(size+1);
	if (bar == NULL) {
		perror("malloc");
		exit(1);
	}
	bar[0] = '[';
	for (int i = 1; i < num+1; i++) {
	      bar[i] = '*';
	}
	for (int i = num+1; i < size-1; i++) {
	      bar[i] = ' ';
	}
	bar[size-1] = ']';
	bar[size] = '\0';
	return bar;
}

char*
getstatus(int volume, char *lang, char *tla) {
  /* return smprintf(" \033[0;36mVolume: \033[1;31m%i%% \033[0m \033[1;37m>>\033[0m \033[0;36mLanguage: \033[1;31m%s \033[1;37m>>\033[0;32m %s",  */
  /*                 volume, lang, tla); */
  return smprintf(" Volume: %i%%  >> \033[0;36mLanguage: \033[1;31m%s \033[1;37m>>\033[0;32m %s", 
                  volume, lang, tla);
}

int
main(int argc, char *argv[])
{
	char *tla;
        char *lang;
	int volume;
        int setvol;

	if (!(dpy = XOpenDisplay(NULL))) {
		fprintf(stderr, "dwmstatus: cannot open display.\n");
		return 1;
	}

	if (argc > 1) {
		if (strcmp(argv[1], "volume") == 0) {
			if (strcmp(argv[2], "up") == 0) {
				volume = getvolume();
                                lang = getlang();
				if (volume < 100)
					volume += 5;
				setvolume(volume);
				tla = mktimes("%F %H:%M", tzukraine);
                                setstatus(getstatus(volume, lang, tla));
                                free(lang);
				free(tla);
				exit(0);
			} else if (strcmp(argv[2], "down") == 0) {
                                volume = getvolume();
                                lang = getlang();
				if (volume > 0)
					volume -= 5;
                                setvolume(volume);
                                tla = mktimes("%F %H:%M", tzukraine);
                                setstatus(getstatus(volume, lang, tla));
                                free(lang);
				free(tla);
                                exit(0);
			} else if (strcmp(argv[2], "set") == 0) {
                                lang = getlang();
                                setvol = atoi(argv[3]);
                                setvolume(setvol);
                                volume = getvolume();
                                tla = mktimes("%F %H:%M", tzukraine);
                                setstatus(getstatus(volume, lang, tla));
                                free(lang);
				free(tla);
                                exit(0);
			}
		}
                else if (strcmp(argv[1], "refresh") == 0) {
                  tla = mktimes("%F %H:%M", tzukraine);
                  volume = getvolume();
                  lang = getlang();
                  setstatus(getstatus(volume, lang, tla));
                  free(lang);
                  free(tla);
                  exit(0);
                }
		exit(0);
	}

	for (;;sleep(90)) {
		tla = mktimes("%F %H:%M", tzukraine);
		volume = getvolume();
                lang = getlang();
		setstatus(getstatus(volume, lang, tla));
                free(lang);
		free(tla);
	}

	XCloseDisplay(dpy);

	return 0;
}

