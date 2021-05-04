#####################
# fish Shell 環境構築
#####################

# Digi-Angler
# Update:2021/04/24

#####################
# 設定
#####################

# Neofetch を表示する
neofetch

# 起動時のメッセージを非表示にする
function fish_greeting
  echo "Let's build something epic 🚀"
  echo The time is (set_color FF26AB; date +%T; set_color 00FF9C) and this machine is called $hostname
end

# set -U fish_greeting ""

set -gx TERM xterm-256color

# viモードを有効にする
set -U fish_key_bindings fish_vi_key_bindings

# プロンプトでフルパスを取得する
set -U fish_prompt_pwd_dir_length 0

# theme
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias l "ls -CF"
alias p "pwd"

alias ..1 "cd .."
alias ..2 "cd ../.."
alias ..3 "cd ../../.."
alias ..4 "cd ../../../.."
alias ..5 "cd ../../../../.."

alias exaf "exa --long --all --group-directories-first --bytes --header --group --git"
alias exat "exa --long --all --group-directories-first --bytes --header --group --git --tree --ignore-glob .git"

alias fl "fisher list"

alias g "git"
alias ghg "ghq get"
alias ghl "ghq list"

alias bl "brew list"

alias n "npm"
alias y "yarn"

alias d "docker"
alias dc "docker-compose"

alias v "vim"
alias nv "nvim"
alias t "tmux"
alias e "emacs"
alias emacs "nvim"

alias vz "v ~/.zshrc"
alias nvz "nv ~/.zshrc"
alias vv "v ~/.vimrc"
alias nvv "nv ~/.vimrc"
alias vf "v ~/.config/fish/config.fish"
alias nvf "nv ~/.config/fish/config.fish"

alias q "quit"
alias x "exit"

# nvim
# command -qv nvim && alias vim nvim
# set -gx EDITOR nvim

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# set theme via `starship`
set starship init fish | source



#####################
# テーマ
#####################

# Budspencer theme
if test (uname -s) = "Darwin"
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
end

# 起動時の挨拶を無効にする
# set -U budspencer_nogreeting

# プロンプトの色を変更する
set budspencer_colors 00d7be 5e35b1 7b17eb e6e6e6 37195a e8c317 e6460a ff3270 ffff00 ff26ab d6f02f 00ff9c

# コマンド履歴に表示されるべきではないコマンド
set -U budspencer_nocmdhist c d ll ls m s

# Node バーetョンを表示する
# set -g budspencer_alt_environment "node -v"



#####################
# tmux
#####################

#function attach_tmux_session_if_needed
#    set ID (tmux list-sessions)
#    if test -z "$ID"
#        tmux new-session
#        return
#    end

#    set new_session "Create New Session" 
#    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
#    if test "$ID" = "$new_session"
#        tmux new-session
#    else if test -n "$ID"
#        tmux attach-session -t "$ID"
#    end
#end

#if test -z $TMUX && status --is-login
#    attach_tmux_session_if_needed
#end



#####################
# Develop 設定
#####################

# anyenv 設定
set -x PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)



#####################
# imports
#####################

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
