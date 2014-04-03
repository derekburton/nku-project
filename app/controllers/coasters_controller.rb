class CoastersController < ApplicationController
  def index
    @coasters = Coaster.all
  end
  
  def new
    @coaster = Coaster.new
  end
  
  def create
    @coaster = Coaster.new(params[:coaster].permit(:name, :location, :description, :image_url))
    
    if @coaster.save
      redirect_to coasters_path
      flash.now[:saved] = 'Coaster added'
    else
      render 'new'
    end
  end
  
  def show
    @coaster = Coaster.find(params[:id])
  end
end
