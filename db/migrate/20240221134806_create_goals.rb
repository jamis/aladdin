class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.belongs_to :parent
      t.timestamps
    end
  end
end
