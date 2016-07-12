class RemoveReferencesAgreementZoneGroupFromBookings < ActiveRecord::Migration
  def change
    remove_reference :bookings, :agreement_zone_group, index: true, foreign_key: true
  end
end
