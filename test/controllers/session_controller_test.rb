require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response 302
  end

  test "should get destroy" do
    get :destroy
    assert_response 302
  end

end
