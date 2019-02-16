#!/bin/bash 
#####################################################################
#Project		:	RetroPie_BGM_Player
#Version		:	1.0.0
#Git			:	https://github.com/Naprosnia/RetroPie_BGM_Player
#####################################################################
#Script Name	:	bgm_control.sh
#Date			:	20190216	(YYYYMMDD)
#Description	:	BGM Player settings main menu.
#Usage			:	Should be called from RetroPie\ BGM\ Player.sh.
#Author       	:	Luis Torres aka Naprosnia
#####################################################################
#Credits		:	crcerror : https://github.com/crcerror
#####################################################################

# shorten paths
BGM=$HOME"/RetroPie-BGM-Player"
BGMCONTROL=$BGM"/bgm_control"

function main_menu() {
    local choice

    while true; do
        choice=$(dialog --backtitle "RetroPie BGM Player" --title "RetroPie BGM Player Settings" \
            --ok-label "Select" --cancel-label "Exit" --no-tags \
            --menu "Settings" 25 75 20 \
            "bgm_setvolume" "1 BGM Volume" \
            "bgm_settoggle" "2 Toggle BGM" \
			"bgm_setfade" "3 BGM Fade Effect" \
			"bgm_setingame" "4 BGM Over Games" \
            2>&1 > /dev/tty)
		
		opt=$?
		[ $opt -eq 1 ] && exit
		
        bash $BGMCONTROL/$choice.sh
		
    done
}

main_menu
