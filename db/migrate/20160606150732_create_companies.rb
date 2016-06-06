class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :tradename
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :provincecountry
      t.string :fax
      t.string :email
      t.string :phone
      t.references :company_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
