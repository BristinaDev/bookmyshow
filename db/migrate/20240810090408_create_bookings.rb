class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :number_of_seats
      t.references :user, null: false, foreign_key: true
      t.references :show, null: false, foreign_key: true
      t.string :seat_ids, array: true, default: []

      t.timestamps
    end
  end
end
