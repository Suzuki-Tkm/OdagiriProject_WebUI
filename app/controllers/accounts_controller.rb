class AccountsController < ApplicationController
  # before_action :login_required
  def show
    if current_user
      @qr = RQRCode::QRCode.new(current_user.to_json).as_svg.html_safe
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(params[:account])
    if @user.save
      redirect_to users_path , notice: "登録完了しました"
    else
      flash.alert = "誤りがあります"
      render "new"
    end
  end
end
