# -*- coding: utf-8 -*-
class AgreementZoneGroupsController < AgreementZoneBaseController
  before_action :set_agreement_zone_group, only: [:add_remove_group]

  # Add Group to Agreement Zone
  def add_remove_group
    if @agreement_zone_group
      @agreement_zone_group.destroy
      redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :groups) , status: :see_other, notice: 'Se ha eliminado con exito el Grupo de la Zona del Acuerdo.'
    else
      AgreementZoneGroup.create({agreement_zone_id: @agreement_zone.id, group: params[:group_letter]})
        redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :groups) , status: :see_other, notice: 'Se ha agregado con exito el Grupo a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone_group
      @agreement_zone_group = AgreementZoneGroup.where(agreement_zone_id: @agreement_zone.id).where(group: params[:group_letter]).first
    end
end
