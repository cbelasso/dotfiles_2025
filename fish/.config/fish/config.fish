set -g fish_greeting
string match -q (uname -ms) "Darwin arm64" && fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.local/bin $HOME/.cargo/bin $HOME/.local/nvim/bin $HOME/.miniconda3/bin $HOME/.local/share/nvim/mason/bin
set -gx MANPATH $HOME/.local/share/man /usr/share/man $MANPATH
set -gx DIRENV_LOG_FORMAT ""

set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
set -gx EDITOR hx
set -g fish_prompt_pwd_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
# "bat" as manpager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

alias ls "eza --icons --grid --header"
alias ll "eza --icons --long --header"

abbr -ag ga git add
abbr -ag gaa git add --all
abbr -ag gb git branch
abbr -ag gc git commit
abbr -ag gcm git commit -m
abbr -ag gpsup git push -u origin \(git branch --show-current\)
abbr -ag gp git push
abbr -ag gst git status

# ~/.config/fish/config.fish
starship init fish | source
