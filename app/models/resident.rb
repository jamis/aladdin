class Resident < ApplicationRecord
  has_many :engagements

  scope :current, ->{ where(current: true) }
  scope :former, ->{ where(current: false) }
end
