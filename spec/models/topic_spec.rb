require 'spec_helper'

describe Topic do

  before(:each) do
    @topic = Factory(:topic)
  end

  it "@topic should be valid" do
    @topic.should be_valid
  end

  describe "associations" do
    it "should embed many news" do
      should have_many :news_items
    end

    it "should embed belongs to category" do
      should belong_to :category
    end
  end
end
