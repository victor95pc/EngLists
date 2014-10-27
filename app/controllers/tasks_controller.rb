class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:update, :destroy]


  def create
    @task = Task.new(task_params)
    if @task.save
      render status: :created, nothing: true
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render status: :accepted, nothing: true
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy!
      render status: :accepted, nothing: true
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:list_id, :description, :status)
  end
end
