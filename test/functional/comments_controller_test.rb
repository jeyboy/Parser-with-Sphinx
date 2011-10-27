require File.expand_path(File.dirname(__FILE__) + '/../../spec/spec_helper')

class CommentsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end
end
