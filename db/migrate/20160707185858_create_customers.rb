class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.references :treatment_type, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.references :nationality, index: true, foreign_key: true

      t.references :booking, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
