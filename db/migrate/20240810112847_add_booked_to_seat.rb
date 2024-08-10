class AddBookedToSeat < ActiveRecord::Migration[7.1]
  def change
    add_column :seats, :booked, :boolean, default: false
  end
end
