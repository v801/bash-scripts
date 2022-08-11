#!/usr/bin/env bash
# shellcheck shell=bash
#
# neofetch script for WSL2
# forked from https://github.com/wslutilities/wslu/blob/master/src/wslfetch.sh

hostname=$(</etc/hostname)
wslsys=$(wslsys)
build=$(echo "$wslsys" | grep -Po '^Build: \K.*')
release=$(echo "$wslsys" | grep -Po '^WSL Release: \K.*')
kernel=$(echo "$wslsys" | grep -Po '^WSL Kernel: \K.*')
uptime=$(echo "$wslsys" | grep -Po '^WSL Uptime: \K.*')

case "$distro" in
	*)
		full_text=(
 '                      :::!~!!!!!:.              '
'                   .xUHWH!! !!?M88WHX:.          '
'                 .X*#M@$!!  !X!M$$$$$$WWx:.      '
'                :!!!!!!?H! :!$!$$$$$$$$$$8X:     '
'               !!~  ~:~!! :~!$!#$$$$$$$$$$8X:    '
'              :!~::!H!<   ~.U$X!?R$$$$$$$$MM!    '
'              ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!    '
'                !:~~~ .:!M"T#$$$$WX??#MRRMMM! '
'                ~?WuxiW*`   `"#$$$$8!!!!??!!! '
'              :X- M$$$$       `"T#$T~!8$WUXU~ '
'             :%`  ~#$$$m:        ~!~ ?$$$$$$ '
'           :!`.-   ~T$$$$8xx.  .xWW- ~""##*" '
' .....   -~~:<` !    ~?T#$$@@W@*?$$      /` '
' W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    : '
' #"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!` '
' :::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~ '
' .~~   :X@!.-~   ?@WTWo("*$$$W$TH$! ` '
' Wi.~!X$?!-~    : ?$$$B$Wu("**$RM! '
'$R@i.~~ !     :   ~$$$$$B$$en:`` '
'?MXT@Wx.~    :     ~"##*$$$$M~ ');;
esac


info_text=("${t}Windows 10 Linux Subsystem${reset}"
"${t}${USER}${reset}@${t}${hostname}${reset}"
"${t}Build   :  ${build}"
"${t}Release :  ${release}"
"${t}Kernel  :  ${kernel}"
"${t}Uptime  :  ${uptime}"
"${reset}"
)

function line {
	if [[ "$1" == "1" ]]; then
		CUR_TTY="$(tty)"
		yes -- "${2:-=}" | tr -d $'\n' | head -c "$(stty -a <"$CUR_TTY" | head -1 | sed -e "s|^.*columns ||g" -e "s|;.*$||g")"
	else
		echo ""
	fi
}

info_length=${#info_text[@]}
full_length=${#full_text[@]}

line "$is_line" "-"
# use for loop to read all values and indexes
for (( i=0; i<full_length; i++ ));
do
	tmp=""
	if [[ $i -le ${info_length} ]]; then
		tmp="${info_text[$i]}"
	fi
	echo -e "${full_text[$i]}${tmp}"
done
line "$is_line" "-"
