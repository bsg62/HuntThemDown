require 'test_helper'

class OffensesControllerTest < ActionController::TestCase
  setup do
    @offense = offenses(:one)
    session[:user_id] = User.first.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offense" do
    assert_difference('Offense.count') do
      post :create, offense: { name: @offense.name, reason: @offense.reason, url: @offense.url, ip_address: @offense.ip_address }
    end

    assert_redirected_to offenses_url
  end

  test "should show offense" do
    get :show, id: @offense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offense
    assert_response :success
  end

  test "should update offense" do
    patch :update, id: @offense, offense: { name: @offense.name, reason: @offense.reason, url: @offense.url, ip_address: @offense.ip_address }
    assert_redirected_to offenses_url
  end

  test "should destroy offense" do
    assert_difference('Offense.count', -1) do
      delete :destroy, id: @offense
    end

    assert_redirected_to offenses_url
  end
end
