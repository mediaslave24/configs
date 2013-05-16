#!/usr/bin/env ruby
require 'optparse'

FILES = {
  vim: %w{ ~/.vimrc ~/.vim },
  subtle: "~/.config/subtle/subtle.rb",
  xresources: "~/.Xresources",
  xinitrc: "~/.xinitrc"
}

class Syncer
  DIR = File.expand_path('./configs', __FILE__)
  attr_reader :files
  def initialize(files)
    _files = {}
    files.each do |k,v|
      if v.is_a?(Array)
        v = v.map{|fname| File.expand_path(fname)}
      else
        v = [File.expand_path(v)]
      end
      _files[k.to_sym] = v
    end
    @files = _files
  end
end

options = {}
OptionParser.new do |opts|
  opts.on_tail( "--push FILES", Array, "Push files to repo") do |files|
    puts files
  end
  opts.on('-h', "--help", "Read this message") do
    puts opts
  end
end.parse!(ARGV)
