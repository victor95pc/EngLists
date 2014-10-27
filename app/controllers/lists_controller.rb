class ListsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:update, :destroy]


  def create
    @list = List.new(task_params)
    if @list.save
      render status: :created, nothing: true
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(task_params)
      render status: :accepted, nothing: true
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.destroy!
      render status: :accepted, nothing: true
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
  def set_task
    @list = List.find(params[:id])
  end

  def task_params
    params.require(:list).permit(:name, :user_id)
  end
end
