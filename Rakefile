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

task :pull_vim do
  puts "Copying vimfiles to ~/.vim and ~/.vimrc"
  FileUtils.cp './.vimrc', File.expand_path("~/.vimrc")

  FileUtils.rm_rf File.expand_path('~/.vim')
  FileUtils.cp_r "./.vim", File.expand_path('~/')
  puts "Ok", ''
end

task :pull_subtle do
  puts "Copying subtle.rb to host"
  FileUtils.cp "./subtle.rb", File.expand_path('~/.config/subtle/subtle.rb')
end
