class SessionsController < ApplicationController
  before_action :login_required , only: [:destroy]
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      cookies[:user_id] = {value: user.id }
      if user.administrator?
        redirect_to :root
      else
        redirect_to accounts_edit_path
      end
    else
      flash.alert = "ユーザー名またはパスワードが正しくありません"
      redirect_to :root
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to :root
  end
end
