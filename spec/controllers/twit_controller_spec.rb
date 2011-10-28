require 'spec_helper'

describe TwitController do

  it "should get index" do
    get :index
    response.should be_success
  end

  it "should get new" do
    get :new
    response.should be_success
  end

  it "should get create" do
    get :create
    response.should be_success
  end

end
