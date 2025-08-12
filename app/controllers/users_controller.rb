class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    if user != current_user
      user.destroy
      redirect_to users_path, notice: "Kullanıcı başarıyla silindi."
    else
      redirect_to users_path, alert: "Kendinizi silemezsiniz."
    end
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: "Yetkiniz yok." unless current_user.admin?
  end
end
