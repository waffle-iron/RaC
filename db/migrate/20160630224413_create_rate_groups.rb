class CreateRateGroups < ActiveRecord::Migration
  def change
    create_table :rate_groups do |t|
      t.references :rate, index: true, foreign_key: true
      t.references :agreement_zone_group, index: true, foreign_key: true
      t.references :agreement_zone_group_section, index: true, foreign_key: true
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
