class Event < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :event_categories, dependent: :destroy
  has_many :event_attendees, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :user
  has_many :comments, as: :commentable, dependent: :destroy
  scope :passed_events, -> { where('end_date < ?', Date.today) }
  scope :future_events, -> { where('start_date > ?', Date.yesterday)}
  after_create :create_chatroom
  attribute :date_range

  private

  def create_chatroom
    Chatroom.create(event: self)
  end
end
