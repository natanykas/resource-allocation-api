require 'rails_helper'

RSpec.describe Schedule, type: :model do
 it { should belong_to :user }
 it { should validate_presence_of :room }
 it { should validate_presence_of :date }
 it { should validate_presence_of :time }
 it { should validate_presence_of :user }
end