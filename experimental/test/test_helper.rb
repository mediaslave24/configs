require 'test/unit'
require 'mocha/setup'
require 'syncer'

class Test::Unit::TestCase
  def expand(path)
    File.expand_path(path)
  end
end
