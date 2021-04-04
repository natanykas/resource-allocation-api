class User < ApplicationRecord
    has_many :schedule

    #Validation
    validates :name, presence: true
end
