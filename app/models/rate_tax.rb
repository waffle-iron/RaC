# == Schema Information
#
# Table name: rate_taxes
#
#  id                    :integer          not null, primary key
#  rate_id               :integer
#  agreement_zone_tax_id :integer
#  cost                  :decimal(, )
#  include_in_cost       :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class RateTax < ActiveRecord::Base
  belongs_to :rate
  belongs_to :agreement_zone_tax
end
