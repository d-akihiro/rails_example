require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get new_user_path

    assert_select 'div#error_explanation', 0
    assert_select 'div.field_with_errors input.form-control', 0

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors input.form-control', 4
  end

  test 'valid signup information' do
    get new_user_path

    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  'Example User',
                                         email: 'user@example.com',
                                         password: 'password',
                                         password_confirmation: 'password' } }
    end

    follow_redirect!
    assert_template 'users/show'

    assert_not flash.empty?
    assert_select 'div.alert-success'
  end


end
