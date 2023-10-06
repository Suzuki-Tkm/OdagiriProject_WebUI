class AccountsController < ApplicationController
  # before_action :login_required
  def show
    if current_user
      data = current_user.values_at(:id , :astringency_Fresh , :personality , :painting_taste , :portrait_LandscapePainting , :nature_population , :tradition_revolution , :conservative_active , :bus_question).to_json
      @qr = RQRCode::QRCode.new(data).as_svg(module_size: 6).html_safe
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
