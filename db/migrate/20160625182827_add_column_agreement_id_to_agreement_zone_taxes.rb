class AddColumnAgreementIdToAgreementZoneTaxes < ActiveRecord::Migration
  def change
    add_reference :agreement_zone_taxes, :agreement, index: true, foreign_key: true
  end
end
