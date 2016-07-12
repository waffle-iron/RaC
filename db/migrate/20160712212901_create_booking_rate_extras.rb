class CreateBookingRateExtras < ActiveRecord::Migration
  def change
    create_table :booking_rate_extras do |t|
      t.integer :quantity
      t.references :rate_extra, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
