class AddColumnAgreementIdToAgreementZoneGroups < ActiveRecord::Migration
  def change
    add_reference :agreement_zone_groups, :agreement, index: true, foreign_key: true
  end
end
