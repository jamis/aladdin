class Tag < ApplicationRecord
  has_many :taggings, dependent: :delete_all

  scope :by_name, -> { order(name: :asc) }
  scope :names, -> { pluck(:name) }
end
