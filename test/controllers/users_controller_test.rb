require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do
    @user = users(:one)
  end

  test "should get index" do
    sign_in users(:two)
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    sign_in users(:two)
    get :new
    assert_response :success
  end

  test "should create user" do
    sign_in users(:two)
    assert_difference('User.count') do
      post :create, user: { email: 'myemail@email.com', password: @user.encrypted_password, roles: @user.roles }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    sign_in users(:two)
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:two)
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    sign_in users(:two)
    patch :update, id: @user, user: { email: @user.email, encrypted_password: @user.encrypted_password, roles: @user.roles }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    sign_in users(:two)
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
