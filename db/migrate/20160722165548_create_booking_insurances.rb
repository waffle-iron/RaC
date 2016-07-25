class CreateBookingInsurances < ActiveRecord::Migration
  def change
    create_table :booking_insurances do |t|
      t.references :rate_group_insurance_cost, index: true, foreign_key: true
      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
