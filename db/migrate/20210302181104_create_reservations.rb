class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :start
      t.date :finish
      t.integer :count
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
