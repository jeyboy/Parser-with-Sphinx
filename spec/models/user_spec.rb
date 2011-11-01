require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end

  it "@user_item should be valid" do
    @user.should be_valid
  end

  describe "associations" do
    it "should embed many comments" do
      should have_many :ratings
    end
  end
end