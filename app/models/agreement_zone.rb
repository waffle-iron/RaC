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
  has_many :group_sections, class_name: "AgreementZoneGroupSection", dependent: :destroy
  has_many :extras, class_name: "AgreementZoneExtra", dependent: :destroy
  has_many :insurances, class_name: "AgreementZoneInsurance", dependent: :destroy
  has_many :taxes, class_name: "AgreementZoneTax", dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :bookings, dependent: :restrict_with_error

  def re_arrange_sections
    group_sections = self.group_sections.order(:section)
    group_sections.each_with_index do |group_section, index|
      to = nil
      if group_section == group_sections.last
        to =  90
      else
        to = group_sections[index + 1].section - 1
      end
      group_section.update!(section_to: to)
    end
  end
end
