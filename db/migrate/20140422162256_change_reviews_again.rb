class ChangeReviewsAgain < ActiveRecord::Migration
  def change
    add_index :reviews, :coaster_id
  end
end
