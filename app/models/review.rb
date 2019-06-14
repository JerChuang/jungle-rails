class Review < ActiveRecord::Base
  validates :product, presence: true
  validates :user, presence: true
  validates :rating, presence: true

end
