# == Schema Information
#
# Table name: agreement_zone_group_sections
#
#  id                :integer          not null, primary key
#  agreement_zone_id :integer
#  section           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  agreement_id      :integer
#  section_to        :integer
#

class AgreementZoneGroupSection < ActiveRecord::Base
  belongs_to :agreement_zone
  belongs_to :agreement
  has_many :rate_groups, dependent: :destroy
end
