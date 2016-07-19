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

  def parent_current_rate(agreement_zone = self)
    parent_zone = agreement_zone.get_parent_zone
    rate = parent_zone.current_rate
    unless rate
      rate = parent_zone.parent_current_rate
    end
    rate
  end

  def parent_current_offer(agreement_zone = self)
    parent_zone = agreement_zone.get_parent_zone
    rate = parent_zone.current_offer
    unless rate
      rate = parent_zone.parent_current_offer
    end
    rate
  end

  def get_parent_zone
    AgreementZone.where(zone_id: self.zone.parent_zone_id).where(agreement_id: self.agreement_id).first if self.zone.parent_zone
  end

  def current_rate
    rate = self.rates.where(is_active: true).where(is_offer: false).first
    rate = self.parent_current_rate unless rate
    rate = self.agreement.current_rate unless rate
    rate
  end

  def current_offer
    rate = self.rates.where(is_active: true).where(is_offer: true).first
    rate = self.current_offer unless rate
    rate = self.agreement.current_offer unless rate
    rate
  end

  def rate
    @current_rate = current_rate
    @current_offer = current_offer

    {
        groups: build_groups
    }
  end

  def build_groups
    rate_groups = []

    @current_rate.groups.each do |rate_group|
      offer_group =

      rate_groups << rate_group
    end
    rate_groups

  end
end
