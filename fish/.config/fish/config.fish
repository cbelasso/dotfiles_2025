# ~/.config/fish/config.fish

# -------------------------------
# Greeting
# -------------------------------
set -g fish_greeting

# -------------------------------
# General Settings
# -------------------------------
set -gx TERM xterm-256color
set -gx COLORTERM truecolor

# -------------------------------
# Detect OS
# -------------------------------
set os (uname)
if test $os = Darwin
    # macOS settings
    set -gx HELIX_RUNTIME $HOME/.config/helix/runtime
    set -gx HELIX_CLIPBOARD_PROVIDER pasteboard
    set -gx BREW_PREFIX /opt/homebrew
    fish_add_path $BREW_PREFIX/bin
else if test $os = Linux
    # Linux server settings
    set -gx HELIX_RUNTIME $HOME/.config/helix/runtime
    set -gx HELIX_CLIPBOARD_PROVIDER termcode
    fish_add_path $HOME/.local/bin
end

# -------------------------------
# Editor
# -------------------------------
set -gx EDITOR hx

# -------------------------------
# Zoxide
# -------------------------------
zoxide init fish | source

# -------------------------------
# Starship
# -------------------------------
set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source

# -------------------------------
# Prompt / Theme options
# -------------------------------
set -g fish_prompt_pwd_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# -------------------------------
# Aliases
# -------------------------------
alias ls "eza --icons --grid --header"
alias ll "eza --icons --long --header"

# -------------------------------
# Git abbreviations
# -------------------------------
abbr -ag ga git add
abbr -ag gaa git add --all
abbr -ag gb git branch
abbr -ag gc git commit
abbr -ag gcm git commit -m
abbr -ag gpsup git push -u origin \(git branch --show-current\)
abbr -ag gp git push
abbr -ag gst git status

# -------------------------------
# Edit command line in Helix
# -------------------------------
function fish_edit_command
    set cmd (commandline -cp) # copy the current command line
    set tmp (mktemp) # create a temporary file
    echo $cmd >$tmp
    hx $tmp # open in Helix
    commandline (string trim (cat $tmp)) # replace command with edited contents
    rm $tmp
end

bind \cv fish_edit_command
