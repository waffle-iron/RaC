class CreateAgreementZonesGroups < ActiveRecord::Migration
  def change
    create_table :agreement_zone_groups do |t|
      t.references :agreement_zone, index: true, foreign_key: true
      t.string :group

      t.timestamps null: false
    end
  end
end
