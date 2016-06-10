class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.references :company, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
