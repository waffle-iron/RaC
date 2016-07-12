class AddReferenceAgreementZoneToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :agreement_zone, index: true, foreign_key: true
  end
end
