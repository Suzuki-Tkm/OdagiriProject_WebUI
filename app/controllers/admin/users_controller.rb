class Admin::UsersController < Admin::Base
  skip_forgery_protection only: :updatePicture
  def index
    @users = User.order("id")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to admin_users_path , notice: "更新しました"
    else
      flash.alert = "誤りがあります"
      render "new"
    end
  end

  def updatePicture
    user = User.find(params[:user_id])
    user.update(name: params[:name])
    render json: { message: 'Update successful' }
  end
end
