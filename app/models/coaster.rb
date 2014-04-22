class Coaster < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  has_many :reviews
end
