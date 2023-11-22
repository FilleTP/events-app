class User < ApplicationRecord
  has_many :event_attendees, dependent: :destroy
  has_many :joined_events, through: :event_attendees, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
