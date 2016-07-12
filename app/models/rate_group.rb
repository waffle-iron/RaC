# == Schema Information
#
# Table name: rate_groups
#
#  id                              :integer          not null, primary key
#  rate_id                         :integer
#  agreement_zone_group_id         :integer
#  agreement_zone_group_section_id :integer
#  cost                            :decimal(, )
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class RateGroup < ActiveRecord::Base
  belongs_to :rate
  belongs_to :agreement_zone_group
  belongs_to :agreement_zone_group_section
  has_many :bookings, dependent: :skip_with_errors
end
