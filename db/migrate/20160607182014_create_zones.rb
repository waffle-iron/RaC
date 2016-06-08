class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.integer :parent_zone_id, index: true

      t.timestamps null: false
    end
  end
end
