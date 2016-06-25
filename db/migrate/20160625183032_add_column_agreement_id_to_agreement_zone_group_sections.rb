class AddColumnAgreementIdToAgreementZoneGroupSections < ActiveRecord::Migration
  def change
    add_reference :agreement_zone_group_sections, :agreement, index: true, foreign_key: true
  end
end
