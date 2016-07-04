# == Schema Information
#
# Table name: rate_extras
#
#  id                      :integer          not null, primary key
#  rate_id                 :integer
#  agreement_zone_extra_id :integer
#  cost                    :decimal(, )
#  max_cost                :decimal(, )
#  include_in_cost         :boolean
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class RateExtra < ActiveRecord::Base
  belongs_to :rate
  belongs_to :agreement_zone_extra
end
