require 'test_helper'

class VictimsControllerTest < ActionController::TestCase
  setup do
    @victim = victims(:one)
    session[:user_id] = User.first.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:victims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create victim" do
    assert_difference('Victim.count') do
      post :create, victim: { name: @victim.name }
    end

    assert_redirected_to victims_url
  end

  test "should show victim" do
    get :show, id: @victim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @victim
    assert_response :success
  end

  test "should update victim" do
    patch :update, id: @victim, victim: { name: @victim.name }
    assert_redirected_to victims_url
  end

  test "should destroy victim" do
    assert_difference('Victim.count', -1) do
      delete :destroy, id: @victim
    end

    assert_redirected_to victims_url
  end
end
