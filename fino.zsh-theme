# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function venv_info {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo "%{$fg[green]%}‹${VIRTUAL_ENV:t}›%{$reset_color%}"
    fi
}

function conda_info {
    if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
        echo "%{$fg[green]%}‹${CONDA_DEFAULT_ENV}›%{$reset_color%}"
    fi
}

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function prompt_char {
  command git branch &>/dev/null && echo "±" || echo '○'
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || echo ${SHORT_HOST:-$HOST}
}

local ruby_env='$(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'
local prompt_char='$(prompt_char)'
local venv='$(venv_info)'
local conda='$(conda_info)'

PROMPT="╭─${FG[040]}%n ${FG[239]}at ${FG[033]}$(box_name) ${FG[239]}in %B${FG[226]}%~%b${git_info}${ruby_env}${conda}${venv}${virtualenv_info}
╰─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[239]}on%{$reset_color%} ${FG[255]}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[202]}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="${FG[040]}✔"

ZSH_THEME_RUBY_PROMPT_PREFIX=" ${FG[239]}using${FG[243]} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[239]}using${FG[243]} «"
ZSH_THEME_VIRTUALENV_SUFFIX="»%{$reset_color%}"
