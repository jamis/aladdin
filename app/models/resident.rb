class Resident < ApplicationRecord
  has_many :engagements, dependent: :destroy

  scope :current, ->{ where(current: true) }
  scope :former, ->{ where(current: false) }

  def former?
    !current?
  end
end
