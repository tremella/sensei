class AddIsCoachToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_coach, :bool
  end
end
