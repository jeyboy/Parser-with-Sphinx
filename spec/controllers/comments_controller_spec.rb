require 'spec_helper'

describe CommentsController do

  before (:each) do
    @user = Factory(:user)
    @news = Factory(:news_item)
  end

  describe "GET 'create'" do
    it "should be successful" do
      get :create, :comment_attr => {:user => @user.user_name, :message => "bla bla bla", :news_item_id  => @news.id}
      response.should be_success
    end
  end

end
