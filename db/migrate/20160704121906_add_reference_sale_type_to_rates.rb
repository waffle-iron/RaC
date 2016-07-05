class AddReferenceSaleTypeToRates < ActiveRecord::Migration
  def change
    add_reference :rates, :sale_type, index: true, foreign_key: true
  end
end
