class AddReferenceRateGroupToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :rate_group, index: true, foreign_key: true

  end
end
