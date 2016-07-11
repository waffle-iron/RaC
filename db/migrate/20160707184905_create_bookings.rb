class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :zone, index: true, foreign_key: true
      t.datetime :delivery_date
      t.string :delivery_location
      t.integer :days_number
      t.string :return_location
      t.integer :ttoo_id
      t.integer :rac_id
      t.references :agreement_zone_group, index: true, foreign_key: true
      t.string :booking_number
      t.string :external_reference
      t.references :place_type, index: true, foreign_key: true
      t.string :place_name
      t.string :fly_room
      t.references :user, index: true, foreign_key: true
      

      t.timestamps null: false
    end
  end
end
