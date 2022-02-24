class FavoritesController < ApplicationController

  def create
    target = Target.find(params[:target_id])
    favorite = current_user.favorites.new(target_id: target.id)
    favorite.save
    #非同期実装の際消去

  end

  def destroy
    target = Target.find(params[:target_id])
    favorite = current_user.favorites.find_by(target_id: target.id)
    favorite.destroy
    #非同期実装の際消去

  end
end
