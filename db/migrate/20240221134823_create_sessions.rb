class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.belongs_to :activity
      t.date :occurred_on, null: false
      t.timestamps
    end
  end
end
