class CreateRateGroupInsuranceCosts < ActiveRecord::Migration
  def change
    create_table :rate_group_insurance_costs do |t|
      t.references :rate_group_insurance, index: true, foreign_key: true
      t.references :agreement_zone_insurance, index: true, foreign_key: true
      t.decimal :cost
      t.boolean :include_in_cost

      t.timestamps null: false
    end
  end
end
