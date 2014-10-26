require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create new user' do
    assert User.create!(
               name: 'Victor PC',
               email: 'test@test.com',
               password: '12345678',
               password_confirmation: '12345678'
    )
  end
end
