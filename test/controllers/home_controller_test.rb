require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  setup do
    session[:user_id] = User.first.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
