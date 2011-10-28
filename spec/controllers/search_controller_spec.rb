require 'spec_helper'

describe SearchController do

  before (:all) do
    @topic = Factory(:topic)
  end

  it "should get by_topic" do
    get :by_topic, :id => @topic.id
    response.should be_success
  end

  it "should get by_request" do
    get :by_request
    response.should be_success
  end

end
