class CreateRateTaxes < ActiveRecord::Migration
  def change
    create_table :rate_taxes do |t|
      t.references :rate, index: true, foreign_key: true
      t.references :agreement_zone_tax, index: true, foreign_key: true
      t.decimal :cost
      t.boolean :include_in_cost

      t.timestamps null: false
    end
  end
end
