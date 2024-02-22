class CreateSessionGoals < ActiveRecord::Migration[7.1]
  def change
    create_join_table :sessions, :goals
  end
end
