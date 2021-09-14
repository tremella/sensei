class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.datetime :start
      t.datetime :end
      t.boolean :is_booked, default: false

      # t.timestamps #these tell me when it was made.
    end
  end
end
