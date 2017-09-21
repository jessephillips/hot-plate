require 'admin/admin_controller.rb'

class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
