class User < ApplicationRecord
  has_many :event_attendees
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :joined_events, through: :event_attendees, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
