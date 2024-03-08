class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end

    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :taggable, polymorphic: true
      t.timestamps
    end
  end
end
