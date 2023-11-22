class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :comments, as: :commentable
end
