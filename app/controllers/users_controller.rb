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
      redirect_to :root , notice: "登録完了しました"
    else
      flash.alert = "その名前は使えません"
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      flash.alert = "その名前は使えません"
      redirect_to :root , notice: "登録完了しました"
    else
      render "new"
    end
  end
end
