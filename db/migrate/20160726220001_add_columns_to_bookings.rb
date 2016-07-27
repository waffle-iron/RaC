class AddColumnsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :total_extras, :decimal
    add_column :bookings, :total_insurances, :decimal
    add_column :bookings, :total_groups, :decimal
    add_column :bookings, :total_taxes, :decimal
    add_column :bookings, :total, :decimal
    add_column :bookings, :observations, :text
    add_column :bookings, :current_rate_id, :integer
    add_column :bookings, :current_offer_id, :integer

  end
end
