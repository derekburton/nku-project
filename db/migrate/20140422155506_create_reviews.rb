class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.decimal :rating
      t.text :review
      t.integer :coaster_id
      t.integer :user_id
    end
  end
end
