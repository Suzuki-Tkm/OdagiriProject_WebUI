class UsersController < ApplicationController
  def index
    @users = User.order("id")
  end

  def new
    @user = User.new()
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      cookies[:user_id] = {value: @user.id }
      redirect_to accounts_edit_path , notice: "登録完了しました"
    else
      flash.alert = "誤りがあります"
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to users_path , notice: "登録完了しました"
    else
      flash.alert = "誤りがあります"
      render "new"
    end
  end

  def showPicture
    @user = current_user
  end
end
