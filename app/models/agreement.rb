# == Schema Information
#
# Table name: agreements
#
#  id              :integer          not null, primary key
#  company_id      :integer
#  start_date      :date
#  end_date        :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  commission_base :decimal(, )
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
  has_many :rates, dependent: :destroy

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
