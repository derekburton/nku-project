class Review < ActiveRecord::Base
  belongs_to :coaster
  belongs_to :user
end