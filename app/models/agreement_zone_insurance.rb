# == Schema Information
#
# Table name: agreement_zone_insurances
#
#  id                :integer          not null, primary key
#  agreement_zone_id :integer
#  insurance_id      :integer
#  bill_ttoo         :boolean
#  bill_client       :boolean
#  commisionable     :boolean
#  confidential      :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  agreement_id      :integer
#

class AgreementZoneInsurance < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :agreement_zone
  belongs_to :insurance
  has_many :costs, class_name: "RateGroupInsuranceCost", dependent: :destroy
end
