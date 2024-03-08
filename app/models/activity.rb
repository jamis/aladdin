class Activity < ApplicationRecord
  include Taggable

  has_many :sessions, dependent: :destroy

  scope :active, ->{ where(archived_at: nil) }
  scope :archived, ->{ where.not(archived_at: nil) }

  scope :by_name, -> { order(name: :asc) }

  def archived=(archived)
    converted = ActiveModel::Type::Boolean.new.cast(archived)
    archive!(converted ? Time.now : nil)
  end

  def archive!(at = Time.now)
    return if (archived? && at.present?) || (active? && at.nil?)
    self.archived_at = at ? at : nil
  end

  def deletable?
    sessions.empty?
  end

  def archived?
    archived_at.present?
  end
  alias archived archived?

  def active?
    !archived?
  end
end
