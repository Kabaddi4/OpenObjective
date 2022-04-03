class TargetsController < ApplicationController

helper_method :sort_column, :sort_direction

  def index
    @targets = Target.all.order("#{sort_column} #{sort_direction}")

    @targets = @targets.where('title LIKE ?', "%#{params[:search]}%") if params[:search].present?
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
    @targets = Target.all
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

  #%w = 簡易的変数定義 include?(x) true : false
  def sort_direction
  %w[asc, desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end


  def sort_column
  Target.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end