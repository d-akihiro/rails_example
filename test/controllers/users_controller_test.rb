require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:akihiro)
  end

  test 'should show user' do
    get user_path(@user)
    assert_template 'users/show'
  end
end
