class CreateResidents < ActiveRecord::Migration[7.1]
  def change
    create_table :residents do |t|
      t.string :name, null: false
      t.string :room, null: false
      t.boolean :current, default: true
      t.timestamps
    end
  end
end
