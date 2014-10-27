require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should not create task if it is not sign in" do
    crud_test_task :create, @task
    assert_response :redirect
  end

  test "should not update task if it is not sign in" do
    crud_test_task :update, @task
    assert_response :redirect
  end

  test "should not destroy task if it is not sign in" do
    crud_test_task :destroy, @task
    assert_response :redirect
  end

  test "should create task if it is sign in" do
    sign_in users(:victor)
    crud_test_task :create, @task
    assert_response :success
  end

  test "should update task if it is sign in" do
    sign_in users(:victor)
    crud_test_task :update, @task
    assert_response :success
  end

  test "should destroy task if it is sign in" do
    sign_in users(:victor)
    crud_test_task :destroy, @task
    assert_response :success
  end
end
