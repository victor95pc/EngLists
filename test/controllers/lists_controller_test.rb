require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  setup do
    @list = lists(:software_list)
  end

  test "should not create list if it is not sign in" do
    crud_test_list :create, @list
    assert_response :redirect
  end

  test "should not update list if it is not sign in" do
    crud_test_list :update, @list
    assert_response :redirect
  end

  test "should not destroy list if it is not sign in" do
    crud_test_list :destroy, @list
    assert_response :redirect
  end

  test "should create list if it is sign in" do
    sign_in users(:victor)
    crud_test_list :create, @list
    assert_response :success
  end

  test "should update list if it is sign in" do
    sign_in users(:victor)
    crud_test_list :update, @list
    assert_response :success
  end

  test "should destroy list if it is sign in" do
    sign_in users(:victor)
    crud_test_list :destroy, @list
    assert_response :success
  end
end
