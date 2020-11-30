#!/bin/fish

set SCRIPT_DIR (realpath (dirname (status -f)))

function confirm --description "Confirmation prompt helper function."
    set -l message $argv[1]
    echo "===================================="
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

function install --description "Install package using Pacman"
    sudo pacman -S --needed --noconfirm $argv
end

function alacritty --description "Install Alacritty package and link config files."
    install alacritty
    echo "WARNING: Alacritty is configured by default to start Tmux. If you are not using tmux please change the appropiate configuration at ~/.config/alacritty/alacritty.yml"
    mkdir -p "$HOME/.config/alacritty"
    linkfile ".config/alacritty/alacritty.yml"
end

function neovim --description "Install Neovim package and link config files."
    install neovim nodejs npm
        
    mkdir -p "$HOME/.config/nvim"

    linkfile ".config/nvim/init.vim"
    linkfile ".config/nvim/plugins.vim"
    linkfile ".config/nvim/coc-settings.vim"
end


function tmux --description "Install Tmux package and link config files."
    install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    linkfile ".tmux.conf"
end


function fish_shell --description "Install fish shell dependencies and config files."
    mkdir -p "$HOME/.config/fish/conf.d"

    if confirm "Use powerline-rs?"
        if not type -q cargo
            install rustup base-devel
            rustup install stable
        end

        install unzip
        curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip > /tmp/dotfiles/Hack.zip
        sudo unzip /tmp/dotfiles/Hack.zip /usr/share/fonts/nerd-hack

        cargo install powerline-rs
        linkfile ".config/fish/conf.d/fish_prompt.fish"
    end

    echo "set PATH \$PATH ~/.cargo/bin" >> ~/.config/fish/conf.d/path.fish
    linkfile ".config/fish/conf.d/alias.fish"
end


confirm "Configure Fish Shell?"; and fish_shell
confirm "Configure Tmux?"; and tmux
confirm "Configure Alacritty?"; and alacritty
confirm "Configure NeoVim?"; and neovim

