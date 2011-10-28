require 'spec_helper'

describe NewsItemsController do

  before (:each) do
    @user = Factory(:user)
    sign_in @user
    @news = Factory(:news_item)
  end

  it "should get index" do
    get :index
    response.should be_success
  end

  it "should get show" do
    get :show, :id => @news.id
    response.should be_success
  end

  it "should get change_rating" do
    get :change_rating
    response.should be_success
  end


  #it "should find the right user" do
  #  get :show, :id => @user.id
  #  assigns(:user).should == @user
  #end
end
