subtle = "~/.config/subtle/subtle.rb"
vimrc = "~/.vimrc"
vim = "~/.vim"

def copy_d(opts)
  raise unless opts[:to] && opts[:from]
  to = File.expand_path(opts[:to])
  from = File.expand_path(opts[:from])
  FileUtils.rm_rf(to)
  FileUtils.cp_r from, to
end

def copy_f(opts)
  raise unless opts[:from] && opts[:to]
  to = File.expand_path(opts[:to])
  from = File.expand_path(opts[:from])
  # FileUtils.cp from, to
end

task :subtle do
  puts "Copying subtle config file from ~/.config/subtle/subtle.rb"
  copy_f from: subtle, to: '.'
  puts "Ok",''
end

task :vim do
  puts "Copying ~/.vimrc, and ~/.vim"
  copy_f from: vimrc, to: '.'
  copy_d from: vim, to: "."
  puts 'Ok', ''
end

task :pull_vim do
  puts "Copying vimfiles to ~/.vim and ~/.vimrc"
  copy_f from: "./.vimrc", to: vimrc
  copy_d from: "./.vim", to: vim
  puts "Ok", ''
end

task :pull_subtle do
  puts "Copying subtle.rb to #{subtle}"
  copy_f from: './subtle.rb', to: subtle
  puts "Ok", ""
end
