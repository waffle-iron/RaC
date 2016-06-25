# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  company_id :integer
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agreement < ActiveRecord::Base
  belongs_to :company
  has_many :agreement_zones, dependent: :destroy
  has_many :zones, through: :agreement_zones, dependent: :destroy
  has_many :groups, class_name: "AgreementZoneGroup", dependent: :destroy
  has_many :group_sections, class_name: "AgreementZoneGroupSection", dependent: :destroy
  has_many :extras, class_name: "AgreementZoneExtra", dependent: :destroy
  has_many :insurances, class_name: "AgreementZoneInsurance", dependent: :destroy
  has_many :taxes, class_name: "AgreementZoneTax", dependent: :destroy
end
