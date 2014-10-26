require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should create task" do
    assert_response :success do
      post :create, task: { description: @task.description, list: @task.list, status: @task.status }
    end
  end

  test "should update task" do
    assert_response :success do
      patch :update, id: @task, task: { description: @task.description, list: @task.list, status: false }
    end
  end

  test "should destroy task" do
    assert_response :success do
      delete :destroy, id: @task
    end
  end
end
