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

    # -------------------------------
    # Default Homebrew Python version
    # -------------------------------
    set -gx DEFAULT_PYTHON 3.12

    set python_prefix "/opt/homebrew/opt/python@$DEFAULT_PYTHON/bin"

    # Ensure Homebrew bin and local bin come first
    set -gx PATH $python_prefix $HOME/.local/bin /opt/homebrew/bin $PATH

    # Symlink python and python3 to the default version
    ln -sf $python_prefix/python3 $HOME/.local/bin/python
    ln -sf $python_prefix/python3 $HOME/.local/bin/python3
else if test $os = Linux
    # Linux server settings
    set -gx HELIX_RUNTIME $HOME/.config/helix/runtime
    set -gx HELIX_CLIPBOARD_PROVIDER termcode
    fish_add_path $HOME/.local/bin
    # Ensure miniconda bin is in PATH for Helix
    # fish_add_path $HOME/miniconda3/bin
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
# Direnv
# -------------------------------
direnv hook fish | source

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
alias ls "eza --icons --grid --header --git"
alias ll "eza --icons --long --header --git --group"
alias la "eza --icons --grid --header --git --all"
alias lla "eza --icons --long --header --git --group --all"

# Tree variants
alias lt 'eza --tree --level=2 --long --icons --git --header --group --color=always'
alias lta 'eza --tree --level=2 --long --icons --git --header --group --all --color=always'
alias lt3 'eza --tree --level=3 --long --icons --git --header --group --color=always'
alias lt3a 'eza --tree --level=3 --long --icons --git --header --group --all --color=always'

alias lg lazygit
alias ipython ipython3

# -------------------------------
# Python shortcut & version switching
# -------------------------------
# Ensure local bin exists
mkdir -p $HOME/.local/bin
set -gx PATH $HOME/.local/bin $PATH

# Make `python` behave like `python3`
function python
    python3 $argv
end

# Function to switch Homebrew Python versions
function switch_python
    if test (count $argv) -eq 0
        echo "Usage: switch_python 3.11|3.12|3.14 ..."
        return 1
    end

    set pyver $argv[1]
    set prefix "/opt/homebrew/opt/python@$pyver/bin"

    if test -d $prefix
        # Add version to PATH at the front
        set -gx PATH $prefix $PATH

        # Update symlink so `python` and `python3` point to chosen version
        ln -sf $prefix/python3 $HOME/.local/bin/python
        ln -sf $prefix/python3 $HOME/.local/bin/python3
        echo "Switched python to $pyver"
    else
        echo "Python version $pyver not found via Homebrew"
    end
end

# Optional auto-completion for switch_python
function __switch_python_complete
    for dir in /opt/homebrew/opt/python@*/bin
        set version (string replace -r '.*/python@([0-9]+\.[0-9]+).*' '$1' $dir)
        echo $version
    end
end
complete -c switch_python -a "(__switch_python_complete)"

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
    # Create a temp file with .sh extension
    set tmp (mktemp --suffix=.sh)

    # Capture the current command exactly
    commandline -b >$tmp

    # Open in Helix
    hx $tmp

    # Read back the edited command
    set newcmd (cat $tmp)

    # Replace command line
    commandline --replace -- "$newcmd"

    # Clean up
    rm $tmp
end

# Bind it to Ctrl+V
bind \cv fish_edit_command

# ======================================================================
# Fzf directory search and cd
# ======================================================================
function fzf_cd
    # Search files/dirs with Tab to toggle between local and system-wide
    set -l tmpfile (mktemp)
    echo "local" > $tmpfile

    set -l selected (fd . 2>/dev/null | fzf \
        --header 'Tab: toggle system-wide/local' \
        --bind "tab:execute(echo \$([ \$(cat $tmpfile) = local ] && echo system-wide || echo local) > $tmpfile)+reload([ \$(cat $tmpfile) = local ] && fd . 2>/dev/null || fd . / 2>/dev/null)+clear-selection" \
        --preview 'ls -la {}' \
        --height 50%)

    rm -f $tmpfile

    if test -n "$selected"
        if test -d "$selected"
            cd "$selected"
        else
            cd (dirname "$selected")
        end
        commandline -f repaint
    end
end

# Bind to Ctrl+F Ctrl+F (chord binding)
bind \cf\cf fzf_cd

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

    # watch -n0.1 $PYTHON -m gpustat -a -p
    watch -n0.1 $PYTHON -m gpustat -p

end

# ======================================================================
# HuggingFace / Transformers cache
# ======================================================================
export HF_DATASETS_CACHE="/Users/clyde/workspace/huggingface_datasets"
export HF_HOME="/Users/clyde/workspace/huggingface_datasets"
export TRANSFORMERS_CACHE="/Users/clyde/workspace/huggingface_datasets"
