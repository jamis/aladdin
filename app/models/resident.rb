require 'csv'

class Resident < ApplicationRecord
  has_many :engagements, dependent: :destroy

  scope :current, ->{ where(current: true) }
  scope :former, ->{ where(current: false) }

  def self.import(csv_file)
    transaction do
      CSV.foreach(csv_file) do |(name, room)|
        Resident.create!(name: name, room: room)
      end
    end
  end

  def former?
    !current?
  end
end
