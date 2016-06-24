class CreateAgreementZoneTaxes < ActiveRecord::Migration
  def change
    create_table :agreement_zone_taxes do |t|
      t.references :agreement_zone, index: true, foreign_key: true
      t.references :tax, index: true, foreign_key: true
      t.boolean :bill_ttoo
      t.boolean :bill_client
      t.boolean :commisionable
      t.boolean :confidential

      t.timestamps null: false
    end
  end
end
