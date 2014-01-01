require 'test_helper'

class UserTest < ActiveSupport::TestCase
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
end