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
      redirect_to action: "index" , notice: "登録完了しました"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to action: "index" , notice: "登録完了しました"
    else
      render "new"
    end
  end
end
