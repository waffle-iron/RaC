module AgreementZoneGroupSectionModelConcern
  extend ActiveSupport::Concern

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
