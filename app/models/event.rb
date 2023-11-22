class Event < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :event_categories, dependent: :destroy
  has_many :event_attendees, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :user
  has_many :comments, as: :commentable
  scope :passed_events, -> { where('end_date < ?', Date.today) }
  scope :future_events, -> { where('start_date > ?', Date.yesterday)}
end
