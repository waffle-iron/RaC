module AgreementZoneGroupSectionConcern
  extend ActiveSupport::Concern

  included do
    after_filter :re_arrange_sections, only: [:add_remove]
  end

  def re_arrange_sections
    owner = @agreement_zone || @agreement
    owner.re_arrange_sections
  end
end
