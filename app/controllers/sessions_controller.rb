class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      cookies[:user_id] = {value: user.id }
      redirect_to accounts_edit_path
    else
      flash.alert = "名前とパスワードが一致しません"
      redirect_to :root
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to :root
  end
end
