require 'test_helper'

class TestSyncer < Test::Unit::TestCase
  @@syncer = Syncer.new vim: %w[ ./fixtures/.vim ./fixtures/vimrc ],
                        subtle: "./fixtures/dir/subtle"

  # Syncer must wrap files to array
  def test_true
    assert_equal [expand('./fixtures/.vim'), expand("./fixtures/vimrc")], 
                 @@syncer.files[:vim]
    assert_equal [expand("./fixtures/dir/subtle")],
                 @@syncer.files[:subtle]
  end
end
