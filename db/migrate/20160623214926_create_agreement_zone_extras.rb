class CreateAgreementZoneExtras < ActiveRecord::Migration
  def change
    create_table :agreement_zone_extras do |t|
      t.references :agreement_zone, index: true, foreign_key: true
      t.references :extra, index: true, foreign_key: true
      t.boolean :bill_ttoo
      t.boolean :bill_client

      t.timestamps null: false
    end
  end
end
