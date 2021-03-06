class FavoritesController < ApplicationController

  def create
    @target = Target.find(params[:target_id])
    target = Target.find(params[:target_id])
    favorite = current_user.favorites.new(target_id: target.id)
    favorite.save
  end

  def destroy
    @target = Target.find(params[:target_id])
    target = Target.find(params[:target_id])
    favorite = current_user.favorites.find_by(target_id: target.id)
    favorite.destroy
  end
end
