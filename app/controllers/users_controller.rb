class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :correct_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the To-Do List!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

private
  def user_params
    params.require( :user).permit( :name, :email, :password, 
                                  :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      flash[:success] = "You have no access to others' To-Do List!"
      redirect_to users_path
    else
    end
  end

end
