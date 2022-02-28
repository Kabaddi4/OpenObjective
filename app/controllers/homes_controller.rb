class HomesController < ApplicationController

  def top
    @user = current_user
    @targets = Target.all.page(params[:page]).reverse_order
  end
  
end
