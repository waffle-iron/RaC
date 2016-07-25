class AddColumnReturnDateToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :return_date, :datetime
  end
end
