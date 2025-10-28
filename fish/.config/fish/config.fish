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
# Miniconda
# -------------------------------
set MINICONDA_DIR $HOME/miniconda3
if test -d $MINICONDA_DIR
    set -gx PATH $MINICONDA_DIR/bin $PATH
    status --is-interactive; and source $MINICONDA_DIR/etc/fish/conf.d/conda.fish
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
alias lt='eza --tree --level=2 --long --icons --git --header --group --color=always'
alias lg lazygit
alias ipython ipython3

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


# ======================================================================
# Gpustat shortcut 
# ======================================================================

function gpustat
    set VENV_DIR "$HOME/workspace/gpu/.venv"
    set PYTHON "$VENV_DIR/bin/python"
    set GPUSTAT "$VENV_DIR/bin/gpustat"

    if not test -x $GPUSTAT
        echo "gpustat not found in $VENV_DIR"
        return 1
    end

    watch -n0.1 $PYTHON -m gpustat -a -p
end


# ======================================================================
# VSCode launcher fix for tmux socket issue
# ======================================================================

function code
    # If in tmux and socket is broken, try to fix it
    if set -q TMUX; and set -q VSCODE_IPC_HOOK_CLI; and not test -S "$VSCODE_IPC_HOOK_CLI"
        set NEW_SOCKET (find /run/user/(id -u) -name "vscode-ipc-*.sock" -type s 2>/dev/null | head -1)
        if test -n "$NEW_SOCKET"
            tmux set-environment VSCODE_IPC_HOOK_CLI "$NEW_SOCKET"
            set -gx VSCODE_IPC_HOOK_CLI "$NEW_SOCKET"
        end
    end

    command code $argv
end
