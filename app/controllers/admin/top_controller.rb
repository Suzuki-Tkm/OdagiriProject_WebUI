class Admin::TopController < Admin::Base
  def index
    @users = User.all()
  end
end
