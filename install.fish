#!/bin/fish

set SCRIPT_DIR (realpath (dirname (status -f)))
set -q XDG_DATA_HOME; or set XDG_DATA_HOME $HOME/.local/share
set -q TPM_PATH; or set TPM_PATH $HOME/.tmux/plugins/tpm

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
    if test -L $file
        set -l linkpath (readlink $file)
        if [ linkpath != "$SCRIPT_DIR/$filename" ]
            unlink $file
            ln -s "$SCRIPT_DIR/$filename" $file
        end
    else if test -f $file
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

function require_rust
    if not type -q cargo
        install rustup base-devel
        rustup install stable
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

    # Install Plug.vim
    curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    require_rust
    rustup component add rls rust-analysis rust-src

    linkfile ".config/nvim/init.vim"
    linkfile ".config/nvim/plugins.vim"
    linkfile ".config/nvim/coc-settings.vim"
    
    nvim +PlugInstall +qall
end


function tmux --description "Install Tmux package and link config files."
    install tmux
    if not test -d $TPM_PATH
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    end
    linkfile ".tmux.conf"
end


function fish_shell --description "Install fish shell dependencies and config files."
    mkdir -p "$HOME/.config/fish/conf.d"

    if confirm "Use powerline-rs?"
        require_rust

        install unzip
        curl -Lo $SCRIPT_DIR/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
        sudo unzip $SCRIPT_DIR/Hack.zip -d /usr/share/fonts/nerd-hack
        sudo fc-cache --force
        rm $SCRIPT_DIR/Hack.zip

        cargo install powerline-rs
        linkfile ".config/fish/conf.d/fish_prompt.fish"
        linkfile ".config/fish/conf.d/abbr.fish"
    end

    echo "set PATH \$PATH ~/.cargo/bin" >> ~/.config/fish/conf.d/path.fish
    linkfile ".config/fish/conf.d/alias.fish"
end

confirm "Configure Fish Shell?"; and fish_shell
confirm "Configure Tmux?"; and tmux
confirm "Configure Alacritty?"; and alacritty
confirm "Configure NeoVim?"; and neovim

