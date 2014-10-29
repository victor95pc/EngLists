require 'test_helper'

class ListsManagerControllerTest < ActionController::TestCase
  test 'should get redirect to user login' do
    get :index
    assert_response 302
  end

  test 'should get to index' do
    sign_in users(:victor)
    get :index
    assert_response :success
  end
end
