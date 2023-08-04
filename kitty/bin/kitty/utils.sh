# running both using send-text so that I can see the command entered at the top of the window

id=$(kitty @ launch --type os-window --title kmonad)
sleep 2
kitty @ send-text -m id:$id 'sudo /Users/jerry/source/others/kmonad/kmonad/.stack-work/install/aarch64-osx/90c814cdfddcc925157aaacb5826c72067b88fe0d1680ab776b93a436943eeb3/9.2.5/bin/kmonad ~/.dotfiles/kmonad/kmonad.kbd\n'

# skhd can't find yabai for some reason when i run it from launch, so do it by sending text
tid=$(kitty @ launch --type tab -m id:$id --title skhd)
sleep 2
kitty @ send-text -m id:$tid 'skhd\n'

kitty @ focus-tab -m id:$id
