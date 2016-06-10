class AddColumnsIncludesIgicDiscountMaxDaysMaxDaysMinToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :includes_igic, :boolean
    add_column :agreements, :discount_max, :integer
    add_column :agreements, :days_max, :integer
    add_column :agreements, :days_min, :integer
  end
end
