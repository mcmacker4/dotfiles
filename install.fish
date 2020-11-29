#!/bin/fish

set SCRIPT_DIR (realpath (dirname (status -f)))


function confirm --description "Confirmation prompt helper function."
    set -l message $argv[1]
    while true
        echo $message
        read -l -P "[Y/n] " confirm
        switch $confirm
            case '' Y y
                return 0
            case N n
                return 1
        end
    end
end

function linkfile --description "Takes an argument, creates symlink asking to replace if file exists."
    set -l filename $argv[1]
    set -l file "$HOME/$filename"
    if begin test -L $file; or test -f $file; end
        if confirm "File $filename already exists. Replace?"
            rm $file
            echo "$SCRIPT_DIR/$filename -> $file"
            ln -s "$SCRIPT_DIR/$filename" $file
        end
    else
        echo "$SCRIPT_DIR/$filename -> $file"
        ln -s "$SCRIPT_DIR/$filename" $file
    end
end

function alacritty --description "Install Alacritty package and link config files."
    if confirm "Use Alacritty?"
        if confirm "Install Alacritty using Pacman?"; 
            sudo pacman -S alacritty --needed
        end

        echo "WARNING: Alacritty is configured by default to start Tmux. If you are not using tmux please change the appropiate configuration at ~/.config/alacritty/alacritty.yml"

        mkdir -p "$HOME/.config/alacritty"

        linkfile ".config/alacritty/alacritty.yml"

    end
end

function neovim --description "Install Neovim package and link config files."
    if confirm "Use Neovim?"
        if confirm "Install Neovim using Pacman?"
            sudo pacman -S neovim --needed
        end

        if confirm "Install NodeJS using Pacman?"
            sudo pacman -S nodejs npm --needed
        end

        mkdir -p "$HOME/.config/nvim"

        linkfile ".config/nvim/init.vim"
        linkfile ".config/nvim/plugins.vim"
        linkfile ".config/nvim/coc-settings.vim"

    end
end


function tmux --description "Install Tmux package and link config files."
    if confirm "Use Tmux?"
        if confirm "Install Tmux using Pacman?"
            sudo pacman -S tmux
        end

        linkfile ".tmux.conf"

    end
end

function install_powerline_rs
    if not type -q cargo
        sudo pacman -S rustup
        rustup install stable
    end
    cargo install powerline-rs
end

function fish_shell --description "Install fish shell dependencies and config files."

    mkdir -p "$HOME/.config/fish/conf.d"

    if confirm "Use powerline-rs? This will install Rustup, rust stable toolchain and powerline-rs using cargo."
        install_powerline_rs
        linkfile ".config/fish/conf.d/fish_prompt.fish"
    end

    linkfile ".config/fish/conf.d/alias.fish"

end


fish_shell
tmux
alacritty
neovim
