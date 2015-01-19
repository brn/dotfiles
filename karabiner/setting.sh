#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 23
/bin/echo -n .
$cli set repeat.initial_wait 0
/bin/echo -n .
$cli set remap.hhkmode 1
/bin/echo -n .
$cli set option.emacsmode_controlPNBF 1
/bin/echo -n .
$cli set option.emacsmode_controlD 1
/bin/echo -n .
/bin/echo
