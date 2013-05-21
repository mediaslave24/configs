#!/bin/bash
make
sudo make install
kill -9 $(pidof dwmstatus)
dwmstatus &
