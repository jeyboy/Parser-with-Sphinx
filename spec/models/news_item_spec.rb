require 'spec_helper'

describe NewsItem do
  before(:each) do
    @news = Factory(:news_item)
  end

  it "@news_item should be valid" do
    @news.should be_valid
  end

  describe "associations" do
    it "should embed many comments" do
      should have_many :comments
    end

    it "should embed belongs to topic" do
      should belong_to :topic
    end
  end
end

