class Review < ActiveRecord::Base
  belongs_to :coaster
  belongs_to :user
  
  def self.avg_review
    reviews = Review.all
    rating = 0
    count = 0
    reviews.each do |r|
      rating = rating + r.rating
      count = count + 1
    end
    rating.to_f / count.to_f
  end
  
end