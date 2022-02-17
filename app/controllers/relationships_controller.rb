class RelationshipsController < ApplicationController

  #User.rbモデルで作成したメソッドをここで経由して使用する
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
end
