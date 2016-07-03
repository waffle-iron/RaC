# == Schema Information
#
# Table name: rate_group_insurances
#
#  id                      :integer          not null, primary key
#  rate_id                 :integer
#  agreement_zone_group_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class RateGroupInsurance < ActiveRecord::Base
  belongs_to :rate
  belongs_to :agreement_zone_group
  has_many :costs, class_name: "RateGroupInsuranceCost", dependent: :destroy, autosave: true

  accepts_nested_attributes_for :costs, :allow_destroy => true
end
