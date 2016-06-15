class CreateAgreementZoneGroupSections < ActiveRecord::Migration
  def change
    create_table :agreement_zone_group_sections do |t|
      t.references :agreement_zone, index: true, foreign_key: true
      t.integer :section

      t.timestamps null: false
    end
  end
end
