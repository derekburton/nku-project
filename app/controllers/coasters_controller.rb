class CoastersController < ApplicationController
  def index
    @coasters = Coaster.all
  end
  
  def new
    if(session[:user_id])
      @coaster = Coaster.new
    else
      redirect_to coasters_path, notice: "Not logged in"
    end
  end
  
  def create
    @coaster = Coaster.new(coaster_params)
    
    if @coaster.save
      redirect_to coasters_path, notice: 'Coaster added'
    else
      render 'new'
    end
  end
  
  def show
    @coaster = Coaster.find(params[:id])
    @reviews = Review.where(coaster_id: params[:id])
  end
  
  private
  def coaster_params
    params.require(:coaster).permit(:name, :location, :description, :image_url, :video_url)
  end
end
