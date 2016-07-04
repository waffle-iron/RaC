class AddColumnCommissionBaseToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :commission_base, :decimal
  end
end
