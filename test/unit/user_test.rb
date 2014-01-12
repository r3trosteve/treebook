require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  should have_many(:user_friendships)
  should have_many(:friends)  

   test "the user should enter a first name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:first_name].empty?
  end



   test "the user should enter a last name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:last_name].empty?
  end



   test "the user should enter a profile name" do
  		user = User.new
  		assert !user.save
  		assert !user.errors[:profile_name].empty?
  end



   test "the user should have a unique profile name" do
  		user = User.new
  		user.profile_name = 'r3trosteve'
  		user.email = 'stevebschofield@gmail.com'
  		user.first_name = 'Steve'
  		user.last_name = 'Schofield'
  		user.password = 'password'
  		user.password_confirmation = 'password'
  		assert !user.save
  		puts user.errors.inspect
  		assert !user.errors[:profile_name].empty?
  end

   test "the user should have a profile name without spaces" do
  		user = User.new
  		user.profile_name = "My profile with spaces"

  		assert !user.save
  		assert !user.errors[:profile_name].empty?
  		assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

   test "that no error is raised when trying to access a friend list" do
  	assert_nothing_raised do
  		users(:steve).friends
  	end
  end

  test "taht creating friendships on a user works" do
  	users(:steve).friends << users(:mike)
  	users(:steve).friends.reload
  	assert users(:steve).friends.include?(users(:mike))
  end

  test "that creating a friendship based on user id and friend id works" do
  	UserFriendship.create user_id: users(:steve).id, friend_id: users(:mike).id
  	assert users(:steve).friends.include?(users(:mike))
  end

  test "that calling to_param on a user returns the profile_name" do
    assert_equal "r3trosteve", users(:steve).to_param
  end

end
