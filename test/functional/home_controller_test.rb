require 'test_helper'

class HomeTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get register" do
    get :register
    assert_response :success
  end

  test "should post without authentication login" do
    post :login
    assert_redirected_to register_path
  end

#  test "should post with authentication login" do
#    post :login
#    asser_redirected_to users_path
#  end

  test "should get without authentication logout" do
    get :logout
    assert_redirected_to register_path
  end

#  test "should get with authentication logout" do
#    get :logout
#    assert_redirected_to root_path
#  end

end
