require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:user1)
  end

  test "should get index" do
    get :index
    assert_redirected_to register_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => @user.attributes
    end
    assert_redirected_to user_path(assigns(:user))
  end

  test "should get edit" do
    get :edit, :id => @user.to_param
    assert_redirected_to register_path
  end

  test "should update user" do
    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to register_path
  end
  
end
