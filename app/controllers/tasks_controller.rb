class TasksController < ApplicationController
  before_action :correct_user

  def index
  end

  def new
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.create(task_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end


private
  def task_params
    params.require(:task).permit( :title, :deadline, :details, :tags)
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user
  end
end
