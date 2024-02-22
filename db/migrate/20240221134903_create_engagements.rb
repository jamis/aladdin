class CreateEngagements < ActiveRecord::Migration[7.1]
  def change
    create_table :engagements do |t|
      t.belongs_to :session
      t.belongs_to :resident
      t.boolean :invited, default: false
      t.boolean :attended, default: false
      t.text :notes
      t.timestamps
    end
  end
end
