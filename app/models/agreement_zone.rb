# == Schema Information
#
# Table name: agreement_zones
#
#  id           :integer          not null, primary key
#  agreement_id :integer
#  zone_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AgreementZone < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :zone
  has_many :groups, class_name: "AgreementZoneGroup", dependent: :destroy
  # has_many :agreement_zone_groups, as: :groups
end
