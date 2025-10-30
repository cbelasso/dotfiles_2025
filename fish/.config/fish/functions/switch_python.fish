function switch_python
    if test (count $argv) -eq 0
        echo "Usage: switch_python 3.11|3.12|3.14 ..."
        return 1
    end

    set pyver $argv[1] # <-- rename from 'version' to 'pyver'
    set prefix "/opt/homebrew/opt/python@$pyver/bin"

    if test -d $prefix
        # Add version to PATH at the front
        set -gx PATH $prefix $PATH

        # Update symlink so `which python` works
        ln -sf $prefix/python3 $HOME/.local/bin/python
        echo "Switched python to $pyver"
    else
        echo "Python version $pyver not found via Homebrew"
    end
end
