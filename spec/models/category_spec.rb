require 'spec_helper'

describe Category do
  before(:each) do
    @category = Factory(:category)
  end
  it "@category should be valid" do
    @category.should be_valid
  end
  describe "associations" do
    it "should embed many topics" do
      should have_many :topics
    end
  end
end
