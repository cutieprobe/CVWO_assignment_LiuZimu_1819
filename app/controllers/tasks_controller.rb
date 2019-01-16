class TasksController < ApplicationController
  before_action :correct_user

  def index
    @user = User.find(params[:user_id])
    @all_tasks = @user.tasks.all
    @tasks = @all_tasks.tagged_with(params[:search]).order("created_at DESC")
  end

  def new
  end

  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(task_params)
    if @task.save
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to user_task_path(@user, @task)
    else 
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:id])
    @task.destroy
    redirect_to user_path(@user)
  end 


private
  def task_params
    params.require(:task).permit( :title, :deadline, :details, :tag_list)
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless @user == current_user
  end
end
