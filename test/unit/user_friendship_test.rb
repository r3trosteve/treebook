require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)

  test "that creating a friendship works without raising an exception" do
  	assert_nothing_raised do
  		UserFriendship.create user: users(:steve), friend: users(:mike)
  	end
  end

  test "that creating a friendship based on user id and friend id works" do
  	UserFriendship.create user_id: users(:steve).id, friend_id: users(:mike).id
  	assert users(:steve).friends.include?(users(:mike))
  end

  context "a new instance" do
  	setup do
  		@user_friendship = UserFriendship.new user: users(:steve), friend: users(:mike)
  	end

  	should "have a pending state" do
  		assert_equal 'pending', @user_friendship.state
  	end
  end

  context "#send_request_email" do
  	setup do
  		@user_friendship = UserFriendship.new user: users(:steve), friend: users(:mike)
  	end

  	should "send an email" do

  	end
  end
end
