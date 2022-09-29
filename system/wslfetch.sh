#! /usr/bin/env bash

# custom neofetch for *nix and WSL2
# forked from https://github.com/wslutilities/wslu/blob/master/src/wslfetch.sh

# exit immediately on non-zero exit status
set -e

## setup vars and info block
getInfo() {
  user=$(whoami)
  hostname=$(< /etc/hostname)
  # check for WSL
  if [ -x "$(command -v wslsys)" ]; then
    title=$(printf "Windows 10 Linux Subsystem")
    wslsys=$(wslsys)
    build=$(printf "$wslsys" | grep -Po '^Build: \K.*')
    release=$(printf "$wslsys" | grep -Po '^WSL Release: \K.*')
    kernel=$(printf "$wslsys" | grep -Po '^WSL Kernel: \K.*')
    uptime=$(printf "$wslsys" | grep -Po '^WSL Uptime: \K.*')
    infoText=(
      "${t}${title}${reset}"
      "${t}${user}${reset}@${t}${hostname}${reset}"
      "${t}Build   :  ${build}"
      "${t}Release :  ${release}"
      "${t}Kernel  :  ${kernel}"
      "${t}Uptime  :  ${uptime}"
      "${reset}"
    )
  else
    distro=$(lsb_release -i|cut -f 2)
    title=$(printf "${distro} Linux")
    release=$(lsb_release -r|cut -f 2)
    kernel=$(uname -r)
    uptime=$(uptime -p | cut -f 2-9 -d " ")
    infoText=(
      "${t}${title}${reset}"
      "${t}${user}${reset}@${t}${hostname}${reset}"
      "${t}Release :  ${release}"
      "${t}Kernel  :  ${kernel}"
      "${t}Uptime  :  ${uptime}"
      "${reset}"
    )
  fi
}

## get ascii
getAscii() {
ascii=(
'                       :::!~!!!!!:.              '
'                   .xUHWH!! !!?M88WHX:.           '
'                 .X*#M@$!!  !X!M$$$$$$WWx:.       '
'                :!!!!!!?H! :!$!$$$$$$$$$$8X:      '
'               !!~  ~:~!! :~!$!#$$$$$$$$$$8X:     '
'              :!~::!H!<   ~.U$X!?R$$$$$$$$MM!     '
'              ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM! '
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
'?MXT@Wx.~    :     ~"##*$$$$M~ ')
}

line() {
  if [[ "$1" == "1" ]]; then
    CUR_TTY="$(tty)"
    yes -- "${2:-=}" | tr -d $'\n' | head -c "$(stty -a <"$CUR_TTY" | head -1 | sed -e "s|^.*columns ||g" -e "s|;.*$||g")"
  else
    echo ""
  fi
}

## align info text with ascii
alignText() {
  infoLength=${#infoText[@]}
  asciiLength=${#ascii[@]}

  line "$isLine" "-"
  # use for loop to read all values and indexes
  for (( i=0; i<asciiLength; i++ ));
  do
    tmp=""
    if [[ $i -le ${infoLength} ]]; then
      tmp="${infoText[$i]}"
    fi
    echo -e "${ascii[$i]}${tmp}"
  done
  line "$isLine" "-"
}

## main function
main() {
  getInfo
  getAscii
  alignText
}

main
