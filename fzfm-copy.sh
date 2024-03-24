#!/bin/bash
fzfm (){
      while true;
      do
          selection="$(lsd -a | fzf \
              --reverse \
              --height 95% \
              --prompt "Search: " \
              --border "bold" \
              --border-label "$(pwd)/" \
              --bind "left:pos(2)+accept" \
              --bind "right:accept" \
              --bind "shift-up:preview-up" \
              --bind "shift-down:preview-down" \
              --preview-window=right:65% \
              --preview 'cd_pre="$(echo $(pwd)/#echo {}))";
                      echo "Folder: " $cd_pre;
                      echo;
                      lsd -a --color=always "${cd_pre}";
                      txt_file="$(file {} | grep '[Tt]ext' | wc -l)";
                      if [[ "${txt_file}" -eq 1 ]]; then
                          bat --style=numbers --theme=ansi --color=always {} 2>/dev/null
                      else
                         chafa -c full --color-space rgb --dither none -p on -w 9 2>/dev/null {}
                      fi')"
                      if [[ -d "${selection}" ]]
                      then
                         >/dev/null cd "${selection}"
                      else
                         break
                      fi
          done
       }
       clear
       fzfm
                
