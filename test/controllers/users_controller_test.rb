require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user       = users(:akihiro)
    @other_user       = users(:michael)
  end

  test 'should show user when logged in' do
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' }}
    get user_path(@user)
    assert flash.empty?
    assert_template 'users/show'
  end

  test 'should redirect user when not logged in' do
    get user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test 'should show user when other user logged in' do
    post login_path, params: { session: { email: @other_user.email,
                                          password: 'password' }}
    get user_path(@user)
    assert_redirected_to root_url
  end
end
