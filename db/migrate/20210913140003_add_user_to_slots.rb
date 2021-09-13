class AddUserToSlots < ActiveRecord::Migration[6.1]
  def change
    add_reference :slots, :coach, foreign_key: { to_table: :users }
    add_reference :slots, :student, foreign_key: { to_table: :users }
  end
end
