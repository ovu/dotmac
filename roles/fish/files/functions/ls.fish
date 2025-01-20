function ls --description 'always show colors with ls'
  # command gls --color=auto $argv
  command eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions $argv
end

