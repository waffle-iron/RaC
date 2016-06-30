# -*- coding: utf-8 -*-
class AgreementZoneGroupSectionsController < AgreementZoneBaseController
  before_action :set_agreement_zone_group_section, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_group_section
      @agreement_zone_group_section.destroy
      redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :group_sections) , status: :see_other, notice: 'Se ha eliminado con exito el Tramo de la Zona del Acuerdo.'
    else
      AgreementZoneGroupSection.create({agreement_zone_id: @agreement_zone.id, section: params[:section]})
        redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :group_sections) , status: :see_other, notice: 'Se ha agregado con exito el Tramo a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone_group_section
      @agreement_zone_group_section = AgreementZoneGroupSection.where(agreement_zone_id: @agreement_zone.id).where(section: params[:section]).first
    end
end
