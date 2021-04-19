class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :room_price
      t.string :room_address
      t.string :room_image
      t.date :startday
      t.date :finishday
      t.integer :people

      t.timestamps
    end
  end
end
