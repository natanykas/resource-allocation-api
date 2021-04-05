# encoding: utf-8

class User < ApplicationRecord
  has_many :schedule

  validates :name, presence: true
end
