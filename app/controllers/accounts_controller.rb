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
end
