class RemoveColumnZoneFromBookings < ActiveRecord::Migration
  def change
    remove_reference :bookings, :zone
  end
end
