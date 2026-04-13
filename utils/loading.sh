show_loading() {
  local msg="${1:-traduciendo...}"
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  local i=0

  clear
  echo -e "\e[1;32m"
  cat << 'EOF'
       _
       \`*-.
        )  _`-.
       .  : `. .
       : _   '  \
       ; *` _.   `*-._
       `-.-'          `-.
         ;       `       `.
         :.       .        \
         . \  .   :   .-'   .
         '  `+.;  ;  '      :
         :  '  |    ;       ;-.
         ; '   : :`-:     _.`* ;
[bug] .*' /  .*' ; .*`- +'  `*'
      `*-*   `*-*  `*-*'
EOF
  echo -e "\e[0m"
  echo -e "\e[1;34m----------------------------------------\e[0m"

  while true; do
    echo -ne "\e[1;32m  ${frames[$i]} \e[0m\e[1;34m${msg}\e[0m\r"
    i=$(( (i + 1) % ${#frames[@]} ))
    sleep 0.1
  done
}
