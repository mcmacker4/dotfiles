function fish_prompt
    ~/Programs/powerline-rs/target/release/powerline-rs --shell bare --cwd-no-ellipsis --cwd-max-dir-size 3 $status
    echo ""
end
