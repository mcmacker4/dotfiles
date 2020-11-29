#!/bin/fish

set -l SCRIPT_DIR (realpath (dirname (status -f)))

echo $SCRIPT_DIR


function confirm --description "Confirmation prompt helper function."
    set -l message $argv[1]
    while true
        read -l -P "$message [y/N] " confirm
        switch $confirm
            case '' Y y
                return 0
            case N n
                return 1
        end
    end
end

function linkfile --description "Takes an argument, creates symlink asking to replace if file exists."
    set -l file $argv[1]
    if test -e "$HOME/$file"
        if confirm "File $file already exists. Replace?"
            rm $file
            ln -s "$SCRIPT_DIR/$file" "$HOME/$file"
        end
    else
        ln -s "$SCRIPT_DIR/$file" "$HOME/$file"
    end
end

function alacritty --description "Install Alacritty package and link config files."
    if confirm "Use Alacritty?"
        if confirm "Install Alacritty using Pacman?"
            sudo pacman -S alacritty
        end

        echo "WARNING: Alacritty is configured by default to start Tmux. If you are not using tmux please change the appropiate configuration at ~/.config/alacritty/alacritty.yml"

        mkdir -p "$HOME/.config/alacritty"

        linkfile ".config/alacritty/alacritty.yml"

    end
end

function neovim --description "Install Neovim package and link config files."
    if confirm "Use Neovim?"
        if confirm "Install Neovim using Pacman?"
            sudo pacman -S neovim
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

function fish_shell --description "Install fish shell dependencies and config files."

    if confirm "Install powerline-rs using Paru?"
        paru -S powerline-rs
    else
        echo "WARNING: Fish config files use powerline-rs as the prompt. If you do not want this please delete ~/.config/fish/conf.d/fish_prompt.fish after installation."
    end

    mkdir -p "$HOME/.config/fish/conf.d"

    linkfile ".config/fish/conf.d/fish_prompt.fish"
    linkfile ".config/fish/conf.d/alias.fish"

end

alacritty
