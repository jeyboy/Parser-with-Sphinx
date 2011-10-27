require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper')

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  describe Comment do
    it { should belong_to :news }
  end
end
