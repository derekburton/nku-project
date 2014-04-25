class ReviewsController < ApplicationController

  def index
    @show_reviews = Review.where(user_id: session[:user_id])
  end
  
  def create
    if(Review.where(user_id: session[:user_id], coaster_id: params[:coaster_id]).empty?) 
      @coaster = Coaster.find(params[:coaster_id])
      @review = @coaster.reviews.create(params.require(:review).permit(:rating, :review))
      @review.user_id = session[:user_id]
      @review.save!
    end
    redirect_to coaster_path(@coaster)
  end
  
end
