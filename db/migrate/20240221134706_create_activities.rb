class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.string :abbv, null: false
      t.timestamps
    end
  end
end
