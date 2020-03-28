require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'user with a valid email should be valid' do
    user = User.new(email: 'valid@email.com', password_digest: 'hashed_password')
    assert user.valid?
  end

  test 'user with a invalid email should be invalid' do
    user = User.new(email: 'invalid_email.com', password_digest: 'hashed_password')
    assert_not user.valid?
  end

  test 'user with existing email should be invalid' do
    existing_user = users(:one) # fetch user from db, user can be found at tests/fixtures/user_test.rb
    user = User.new(email: existing_user.email, password_digest: 'hashed_password')
    assert_not user.valid?
  end

end
