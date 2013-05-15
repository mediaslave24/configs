task :subtle do
  puts "Copying subtle config file from ~/.config/subtle/subtle.rb"
  FileUtils.cp File.expand_path("~/.config/subtle/subtle.rb"), '.'
  puts "Ok",''
end

task :vim do
  puts "Copying ~/.vimrc, and ~/.vim"
  FileUtils.cp File.expand_path("~/.vimrc"), '.'
  FileUtils.rm_rf File.expand_path('./.vim')
  FileUtils.cp_r File.expand_path("~/.vim"), '.'
  puts 'Ok', ''
end
