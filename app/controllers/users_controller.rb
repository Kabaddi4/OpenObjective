class UsersController < ApplicationController

  def index
    @users = User.all.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @targets = @user.targets.reverse_order #reverse_order:ソート
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_user.page(params[:page]).per(3).reverse_order
  end

  def followers
    user = User.find(params[:id])
    @users = user.follower_user.page(params[:page]).per(3).reverse_order
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
