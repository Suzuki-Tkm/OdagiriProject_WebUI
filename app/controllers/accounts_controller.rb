class AccountsController < ApplicationController
  # before_action :login_required
  def show
    if current_user
      @qr = RQRCode::QRCode.new(current_user.to_json).as_svg(module_size: 6).html_safe
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(params[:account])
    if @user.save
      redirect_to users_path , notice: "フォームを更新しました"
    else
      flash.alert = "誤りがあります"
      render "new"
    end
  end
end
