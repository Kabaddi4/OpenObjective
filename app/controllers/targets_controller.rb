class TargetsController < ApplicationController

  def index
    @targets = Target.all
  end

  def new
    @target = Target.new
  end
end
