module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable, dependent: :delete_all
    has_many :tags, through: :taggings
  end

  def tag_list
    new_record? ? tags.map(&:name) : tags.by_name.names
  end

  def tag_list_json
    tag_list.to_json
  end

  def tag_list_json=(json)
    list = JSON.parse(json)
    self.tags = Tag.where(name: list)

    if self.tags.length != list.length
      (list - self.tags.map(&:name)).each do |name|
        self.tags << Tag.new(name: name)
      end
    end
  end
end
