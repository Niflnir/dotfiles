# App you want to start :
apps=(
 #if you're using urxvt then replace st with that	
 "kitty"
 "google-chrome-stable"
 "telegram-desktop"
)

# Which workspace to assign your wanted App :
workspaces=(
" Terminal"
" Chrome"
" Telemail"
)

# counter of opened windows
owNB=0


for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt "$iwin" ] # wait before start other programs
    do
        owNB=$(wmctrl -l | wc -l) # Get number of actual opened windows
    done

    i3-msg workspace ${workspaces[$iwin]} # move in wanted workspace
    ${apps[$iwin]} & # start the wanted app
    sleep 2
    
done
