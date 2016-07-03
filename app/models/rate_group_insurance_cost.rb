# == Schema Information
#
# Table name: rate_group_insurance_costs
#
#  id                          :integer          not null, primary key
#  rate_group_insurance_id     :integer
#  agreement_zone_insurance_id :integer
#  cost                        :decimal(, )
#  include_in_cost             :boolean
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class RateGroupInsuranceCost < ActiveRecord::Base
  belongs_to :rate_group_insurance
  belongs_to :agreement_zone_insurance
end
