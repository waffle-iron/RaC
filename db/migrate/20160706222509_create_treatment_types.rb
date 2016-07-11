class CreateTreatmentTypes < ActiveRecord::Migration
  def change
    create_table :treatment_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
