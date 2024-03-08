class Session < ApplicationRecord
  include Taggable

  belongs_to :activity
  has_many :engagements, dependent: :destroy

  def deletable?
    engagements.empty?
  end
end
