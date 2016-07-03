# == Schema Information
#
# Table name: agreement_zone_taxes
#
#  id                :integer          not null, primary key
#  agreement_zone_id :integer
#  tax_id            :integer
#  bill_ttoo         :boolean
#  bill_client       :boolean
#  commisionable     :boolean
#  confidential      :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  agreement_id      :integer
#

class AgreementZoneTax < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :agreement_zone
  belongs_to :tax
  has_many :costs, class_name: "RateTax", dependent: :destroy
end
