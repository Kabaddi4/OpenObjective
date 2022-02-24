class TargetsController < ApplicationController

  def index
    @targets = Target.all
  end

  def create
    @targets = Target.all
    @target = Target.new(target_params)
    @target.user_id = current_user.id
    if @target.save
      redirect_to targets_path
    else
      render :index
    end
  end

  def new
    @target = Target.new
  end

  def show
    @target = Target.find(params[:id])
  end

  def destroy
    target = Target.find(params[:id])
    target.destroy
    redirect_to targets_path
  end


  private

  def target_params
  params.require(:target).permit(:title, :detail, :image_id, :result, :feedback, :created_at, :updated_at)
  end
end