/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-ubuntu mono-medium-r-normal-*-13-*-100-100-*-*-*-uni";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#005577";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int systrayspacing = 5;   /* systray spacing */
static const Bool showsystray       = True;     /* False means no systray */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "www", "editor", "term", "files", "media", "torrents", "messenger", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            True,        -1 },
	{ "Firefox",  NULL,       NULL,       1,            False,       -1 },
	{ "Chromium", NULL,       NULL,       1,            False,        -1 },
	{ "Gvim",     NULL,       NULL,  1 << 1,            False,        -1 },
	{ "URxvt",    NULL,       NULL,  1 << 2,            False,       -1 },
	{ "Pcmanfm",  NULL,       NULL,  1 << 3,            False,       -1 },
	{ "Exaile",   NULL,       NULL,  1 << 4,            False,       -1 },
	{ "Vlc",      NULL,       NULL,  1 << 4,            False,       -1 },
	{ "Deluge",   NULL,       NULL,  1 << 5,            False,       -1 },
	{ "Mirage",   NULL,       NULL,       0,            True,        -1 },
	{ "feh",      NULL,       NULL,       0,            False,       -1 },
	{ "Skype",    NULL,       NULL,  1 << 6,            False,       -1 },

};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define ALTMOD Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] =        { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  =        { "urxvt", NULL };
static const char *browsercmd[] =      { "chromium", NULL };
static const char *musiccmd[] =        { "exaile", NULL };
static const char *fmcmd[] =           { "pcmanfm", NULL };
static const char *torrentscmd[] =     { "deluge", NULL };
static const char *skypecmd[] =        { "skype", "--disable-cleanlooks", "-style", "GTK", NULL };
static const char *toggle_exaile[] =   { "exaile", "-t", NULL };

static const char *volup[] =   { "amixer", "set", "master", "5%+", NULL };
static const char *voldown[] = { "amixer", "set", "master", "5%-", NULL };

static const char *vol0[] = { "amixer", "set", "Master", "0%", NULL };
static const char *vol1[] = { "amixer", "set", "Master", "10%", NULL };
static const char *vol2[] = { "amixer", "set", "Master", "20%", NULL };
static const char *vol3[] = { "amixer", "set", "Master", "30%", NULL };
static const char *vol4[] = { "amixer", "set", "Master", "40%", NULL };
static const char *vol5[] = { "amixer", "set", "Master", "50%", NULL };
static const char *vol6[] = { "amixer", "set", "Master", "60%", NULL };
static const char *vol7[] = { "amixer", "set", "Master", "70%", NULL };
static const char *vol8[] = { "amixer", "set", "Master", "80%", NULL };
static const char *vol9[] = { "amixer", "set", "Master", "90%", NULL };


static const char *xkben[] = { "xkb-switch", "-s", "us", NULL };
static const char *xkbua[] = { "xkb-switch", "-s", "ua", NULL };
static const char *xkbru[] = { "xkb-switch", "-s", "ru", NULL };

static const char *rebootcmd[] =   { "sudo", "reboot",                   NULL };
static const char *shutdowncmd[] = { "sudo", "shutdown", "-h",           NULL };
static const char *blockcmd[] =    { "xscreensaver-command", "-lock",   NULL };
static const char *sleepcmd[] =    { "xscreensaver-command", "-activate", NULL };



static Key keys[] = {
	/* modifier                     key        function        argument */
	{ ALTMOD,                       XK_f,      spawn,          {.v = voldown   } },
	{ ALTMOD,                       XK_g,      spawn,          {.v = volup     } },
	{ ALTMOD,                       XK_0,      spawn,          {.v = vol0      } },
	{ ALTMOD,                       XK_1,      spawn,          {.v = vol1      } },
	{ ALTMOD,                       XK_2,      spawn,          {.v = vol2      } },
	{ ALTMOD,                       XK_3,      spawn,          {.v = vol3      } },
	{ ALTMOD,                       XK_4,      spawn,          {.v = vol4      } },
	{ ALTMOD,                       XK_5,      spawn,          {.v = vol5      } },
	{ ALTMOD,                       XK_6,      spawn,          {.v = vol6      } },
	{ ALTMOD,                       XK_7,      spawn,          {.v = vol7      } },
	{ ALTMOD,                       XK_8,      spawn,          {.v = vol8      } },
	{ ALTMOD,                       XK_9,      spawn,          {.v = vol9      } },
	{ ALTMOD,                       XK_space,  spawn,          {.v = toggle_exaile      } },
	{ ALTMOD,                       XK_a,      spawn,          {.v = xkben      } },
	{ ALTMOD,                       XK_s,      spawn,          {.v = xkbua      } },
	{ ALTMOD,                       XK_d,      spawn,          {.v = xkbru      } },

        /* My additions */
	{ MODKEY,                       XK_Home,   spawn,          {.v = shutdowncmd   } },
	{ MODKEY,                       XK_End,    spawn,          {.v = rebootcmd   } },
	{ MODKEY,                       XK_Delete, spawn,          {.v = blockcmd   } },
	{ MODKEY,                       XK_Insert, spawn,          {.v = sleepcmd   } },
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd   } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd    } },
	{ MODKEY,                       XK_b,      spawn,          {.v = browsercmd } },
	{ MODKEY,                       XK_x,      spawn,          {.v = musiccmd   } },
	{ MODKEY,                       XK_s,      spawn,          {.v = fmcmd      } },
	{ MODKEY,                       XK_z,      spawn,          {.v = skypecmd   } },
	{ MODKEY,                       XK_a,      spawn,          {.v = torrentscmd   } },


	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	// { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	// { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
        { ClkStatusText ,       0,              Button4,        spawn,          {.v = volup } },
        { ClkStatusText ,       0,              Button5,        spawn,          {.v = voldown } },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

