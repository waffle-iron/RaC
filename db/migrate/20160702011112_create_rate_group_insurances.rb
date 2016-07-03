class CreateRateGroupInsurances < ActiveRecord::Migration
  def change
    create_table :rate_group_insurances do |t|
      t.references :rate, index: true, foreign_key: true
      t.references :agreement_zone_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
