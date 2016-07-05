# == Schema Information
#
# Table name: sale_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SaleType < ActiveRecord::Base
  has_many :rates, dependent: :destroy
end
