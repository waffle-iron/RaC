class AddColumnAgreementIdToAgreementZoneInsurances < ActiveRecord::Migration
  def change
    add_reference :agreement_zone_insurances, :agreement, index: true, foreign_key: true
  end
end
