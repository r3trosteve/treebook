require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that /login opens the login page" do 
  	get '/login'
  	assert_response :success
  end

  test "that /logout opens the logout page" do 
  	get '/logout'
  	assert_response :redirect
  	assert_redirected_to "/"
  end

  test "that /register opens the registration page" do 
  	get '/register'
  	assert_response :success
  end

  test "that a profile page works" do
    get '/r3trosteve'
    assert_response :success
  end
end
