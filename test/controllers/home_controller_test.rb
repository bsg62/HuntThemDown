require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = 1
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
