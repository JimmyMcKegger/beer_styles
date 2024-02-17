# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_signin, except: %i[new create]
  before_action :require_correct_user_or_admin, only: %i[edit update delete]
  before_action :require_admin, only: %i[index]

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
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Thanks for signing up!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Account updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to root_path, status: :see_other, alert: 'Account successfully deleted'
    else
      redirect_to @user, status: :unprocessable_entity, alert: @user.errors.full_messages.join(', ')
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  def require_correct_user_or_admin
    @user = User.find(params[:id])
    return if current_user?(@user) || current_user.admin?

    redirect_to root_url, alert: 'You do not have permission to edit or delete this user.'
  end
end
