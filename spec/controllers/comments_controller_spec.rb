require 'spec_helper'

describe CommentsController do

  describe "GET 'index'" do
    it "should be successful" do
      get :create
      response.should be_success
    end
  end

end