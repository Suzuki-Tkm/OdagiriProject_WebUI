
class AccountsController < ApplicationController
  KEY = 'Enter your key here'
  # before_action :login_required
  def show
    if current_user
      data = current_user.values_at(:id , :astringency_Fresh , :personality , :painting_taste , :portrait_LandscapePainting , :nature_population , :tradition_revolution , :conservative_active , :bus_question).to_json.gsub(/"/, '')
      digest = Digest::SHA256.new
      digest.update(KEY)
      enc = OpenSSL::Cipher.new('AES-256-CBC')
      enc.encrypt
      enc.key = digest.digest
      enc.iv = iv = enc.random_iv
      crypted = enc.update(data) + enc.final
      iv_base64 = Base64.encode64(iv).gsub("\n", '')
      crypted_base64 = Base64.encode64(crypted).gsub("\n", '')
      @qr = RQRCode::QRCode.new(iv_base64+crypted_base64, :level => :m).as_svg(module_size: 5).html_safe
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
