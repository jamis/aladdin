class Session < ApplicationRecord
  belongs_to :activity
  has_and_belongs_to_many :goals
  has_many :engagements
end
