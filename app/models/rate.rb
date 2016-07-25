# == Schema Information
#
# Table name: rates
#
#  id                :integer          not null, primary key
#  code              :string
#  from              :date
#  to                :date
#  is_active         :boolean
#  is_offer          :boolean          default(TRUE)
#  commission_base   :decimal(, )
#  agreement_zone_id :integer
#  agreement_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  sale_type_id      :integer
#

class Rate < ActiveRecord::Base
  belongs_to :agreement_zone
  belongs_to :agreement
  belongs_to :sale_type
  has_many :groups, class_name: "RateGroup", dependent: :destroy, autosave: true
  has_many :insurances, class_name: "RateGroupInsurance", dependent: :destroy, autosave: true
  has_many :taxes, class_name: "RateTax", dependent: :destroy, autosave: true
  has_many :extras, class_name: "RateExtra", dependent: :destroy, autosave: true

  accepts_nested_attributes_for :groups, :allow_destroy => true
  accepts_nested_attributes_for :insurances, :allow_destroy => true
  accepts_nested_attributes_for :taxes, :allow_destroy => true
  accepts_nested_attributes_for :extras, :allow_destroy => true

end
