class AddColumnAgreementIdToAgreementZoneExtras < ActiveRecord::Migration
  def change
    add_reference :agreement_zone_extras, :agreement, index: true, foreign_key: true
  end
end
