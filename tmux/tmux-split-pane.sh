#!/bin/bash
#
# Pane Splitter for TMUX @rksz
#
#########################################


## get options ##
readonly CMDNAME=`basename $0`
while getopts :s opt
do
  case $opt in
    "s" ) readonly FLG_S="TRUE" ;;
      * ) echo "usage: $CMDNAME [-s] pane_num" 1>&2
          exit 1 ;;
  esac
done

shift `expr $OPTIND - 1`



## tmux pane split ##
if [ $1 ]; then
  cnt_pane=1
  while [ $cnt_pane -lt $1 ]
  do
    if [ $(( $cnt_pane & 1 )) ]; then
        tmux split-window -h
    else
        tmux split-window -v
    fi
    tmux select-layout tiled 1>/dev/null
    cnt_pane=$(( $cnt_pane + 1 ))
  done
fi


#OPTION: start session with "synchronized-panes"
if [ "$FLG_S" = "TRUE" ]; then
  tmux set-window-option synchronize-panes 1>/dev/null
fi
