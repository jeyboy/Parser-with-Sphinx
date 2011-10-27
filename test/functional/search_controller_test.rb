require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper')

class SearchControllerTest < ActionController::TestCase
  test "should get by_topic" do
    get :by_topic
    assert_response :success
  end

  test "should get by_request" do
    get :by_request
    assert_response :success
  end

end
