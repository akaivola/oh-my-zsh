# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
# local rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
#
# Show date on the right side of prompt
strlen () {
  FOO=$1
  local zero='%([BSUbfksu]|([FB]|){*})'
  LEN=${#${(S%%)FOO//$~zero/}}
  echo $LEN
}

# show right prompt with date ONLY when command is executed
preexec () {
  DATE=$( date +"[%H:%M:%S]" )
  local len_right=$( strlen "$DATE" )
  len_right=$(( $len_right+1 ))
  local right_start=$(($COLUMNS - $len_right))

  local len_cmd=$( strlen "$@" )
  local len_prompt=$(strlen "$PROMPT" )
  local len_left=$(($len_cmd+$len_prompt))

  RDATE="\033[${right_start}C ${DATE}"

  if [ $len_left -lt $right_start ]; then
      # command does not overwrite right prompt
      # ok to move up one line
      echo -e "\033[1A${RDATE}"
  else
      echo -e "${RDATE}"
  fi
}

the_date () {
  D=$(date +'%H:%M:%S')
  "${D}"
}

#PROMPT="${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
PROMPT="$fg[gray]${the_date} $reset_color%}${user_host} ${git_branch}${current_dir}
%B$%b "
RPS1="${return_code} ${preexec}"
RPROMPT="${preexec}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
