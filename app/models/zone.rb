# == Schema Information
#
# Table name: zones
#
#  id             :integer          not null, primary key
#  name           :string
#  parent_zone_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Zone < ActiveRecord::Base
  belongs_to :parent_zone, class_name: 'Zone', foreign_key: :parent_zone_id
  has_many :zones, class_name: 'Zone', foreign_key: :parent_zone_id, dependent: :destroy
  has_many :agreement_zones, dependent: :destroy
  has_many :bookings, dependent: :restrict_with_error
end
