class Schedule < ApplicationRecord
  belongs_to :user

  validates :room, :date, :time_start, :time_end, :user, presence: true

  accepts_nested_attributes_for :user
end
