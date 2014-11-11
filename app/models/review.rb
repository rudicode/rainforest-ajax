class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :comment, :user_id, presence: true
end
