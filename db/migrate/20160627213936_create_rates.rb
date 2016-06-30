class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :code
      t.date :from
      t.date :to
      t.boolean :is_active
      t.boolean :is_offer
      t.decimal :commission_base
      t.references :agreement_zone, index: true, foreign_key: true
      t.references :agreement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
