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
        to = 90
      else
        to = group_sections[index + 1].section - 1
      end
      group_section.update!(section_to: to)
    end
  end

  def parent_current_rate(agreement_zone = self)
    parent_zone = agreement_zone.get_parent_zone
    rate = parent_zone.current_rate if parent_zone
    unless rate
      rate = parent_zone.parent_current_rate if parent_zone
    end
    rate
  end

  def parent_current_offer(agreement_zone = self)
    parent_zone = agreement_zone.get_parent_zone
    rate = parent_zone.current_offer if parent_zone
    unless rate
      rate = parent_zone.parent_current_offer if parent_zone
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
    rate = self.parent_current_offer unless rate
    rate = self.agreement.current_offer unless rate
    rate
  end

  def get_rate
    current_rate = self.current_rate
    current_offer = self.current_offer

    {
      groups: get_rate_groups(current_rate, current_offer)
    }
  end

  def get_rate_groups
    rate_ids = rate_ids(current_rate, current_offer)

    # RateGroup.joins(:agreement_zone_group, :agreement_zone_group_section).where("rate_id in (?)", rate_ids).order("agreement_zone_groups.group ASC").order("agreement_zone_group_sections.section ASC").order("cost DESC")

    # RateExtra.joins(:agreement_zone_extra).where("rate_id in (?)", rate_ids).select('MIN(rate_extras.id) as id, MIN(cost) AS cost').group("agreement_zone_extras.extra_id").order('MIN(cost) ASC').pluck('MIN(rate_extras.id)')

    rate_groups_ids = RateGroup.joins(:agreement_zone_group).where("rate_id in (?)", rate_ids).select("MIN(cost) AS cost, MIN(agreement_zone_groups.group) as group, MIN(rate_groups.id) as id").group("agreement_zone_groups.group").pluck("MIN(rate_groups.id)")

    RateGroup.includes(:agreement_zone_group).where("rate_groups.id in (?)", rate_groups_ids ).order("agreement_zone_groups.group")
  end

  def get_rate_extras
    RateExtra.where("id in (?)", rate_extras_ids)
  end

  def rate_ids(current_rate, current_offer)
    rate_ids = []
    rate_ids << current_offer.id if current_offer
    rate_ids << current_rate.id if current_rate
    rate_ids
  end

  def rate_extras_ids

    rate_ids = self.rate_ids(self.current_rate, self.current_offer)

    RateExtra.joins(:agreement_zone_extra).where("rate_id in (?)", rate_ids).select('MIN(rate_extras.id) as id, MIN(cost) AS cost').group("agreement_zone_extras.extra_id").order('MIN(cost) ASC').pluck('MIN(rate_extras.id)')

  end


end
