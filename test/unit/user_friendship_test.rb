require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friedship works" do
  	assert_nothing_raised do
  		UserFriendship.create user: users(:steve), friend: users(:mike)
  	end
  end
end
