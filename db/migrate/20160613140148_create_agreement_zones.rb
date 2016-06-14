class CreateAgreementZones < ActiveRecord::Migration
  def change
    create_table :agreement_zones do |t|
      t.references :agreement, index: true, foreign_key: true
      t.references :zone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
