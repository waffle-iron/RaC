class CreateRateExtras < ActiveRecord::Migration
  def change
    create_table :rate_extras do |t|
      t.references :rate, index: true, foreign_key: true
      t.references :agreement_zone_extra, index: true, foreign_key: true
      t.decimal :cost
      t.decimal :max_cost
      t.boolean :include_in_cost

      t.timestamps null: false
    end
  end
end
