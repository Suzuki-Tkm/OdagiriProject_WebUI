class UsersController < ApplicationController
  before_action :basic_auth, only: [:updatePicture , :updatePronpt]  # 認証が必要な機能を記述
  before_action :login_required , only: [:index , :edit , :update , :showPicture]
  skip_forgery_protection only: [:updatePicture , :updatePronpt , :updatePictureStyle]
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
      cookies.signed[:user_id] = {
      :value => @user.id
      }
      redirect_to accounts_edit_path , notice: "登録完了しました"
    else
      flash.alert = "名前が使用されています。またはパスワードの入力が正しくありません。"
      redirect_to new_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to users_path , notice: "登録完了しました"
    else
      flash.alert = "名前が使用されています。またはパスワードの入力が正しくありません。"
      redirect_to new_user_path
    end
  end

  def showPicture
    @user = current_user
  end

  def updatePicture
    user = User.find(params[:user_id])
    new_picture = params[:picture]
    user.picture.attach(new_picture)
    # logger.debug(params[:file])
    render json: { message: 'Update successful' }
  end

  def updatePronpt
    user = User.find(params[:user_id])
    user.update(image_recognition: params[:image_recognition])
    user.update(voice_recognition_brightness: params[:voice_recognition_brightness])
    user.update(voice_recognition_weather: params[:voice_recognition_weather])
    render json: { message: 'Update successful' }
  end

  def updatePictureStyle
    user = User.find(params[:user_id])
    user.update(pictureStyle: params[:pictureStyle])
    # logger.debug(user + "更新")
    render json: { message: 'Update successful' }
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user,password|
      user == "user" && password == "pass"
    end
  end
end