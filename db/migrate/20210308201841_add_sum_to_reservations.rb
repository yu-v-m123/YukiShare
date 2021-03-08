class AddSumToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :sum, :integer
    add_column :reservations, :reservation_image, :string
    add_column :reservations, :reservation_name, :string
    add_column :reservations, :reservation_introduction, :text
  end
end
