class AddColumnSectionToToAgreementZoneGroupSections < ActiveRecord::Migration
  def change
    add_column :agreement_zone_group_sections, :section_to, :integer
  end
end
