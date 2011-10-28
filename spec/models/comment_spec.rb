require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Factory(:comment)
  end

  it "@comment should be valid" do
    @comment.should be_valid
  end

  describe "associations" do
    it "should embed many newses" do
      should belong_to :news_item
    end
  end
end

