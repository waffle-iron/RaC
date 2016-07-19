class ChangeColumnIsOfferSetDefaultToFalseToRates < ActiveRecord::Migration
  def change
    change_column :rates, :is_offer, :boolean, :default => true
  end
end
