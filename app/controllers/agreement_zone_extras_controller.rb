# -*- coding: utf-8 -*-
class AgreementZoneExtrasController < AgreementZoneBaseController
  before_action :set_agreement_zone_extra, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_extra
      @agreement_zone_extra.destroy
      redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :extras) , status: :see_other, notice: 'Se ha eliminado con exito el Extra de la Zona del Acuerdo.'
    else
      AgreementZoneExtra.create({agreement_zone_id: @agreement_zone.id, extra_id: params[:extra_id]})
        redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :extras) , status: :see_other, notice: 'Se ha agregado con exito el Extra a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone_extra
      @agreement_zone_extra = AgreementZoneExtra.where(agreement_zone_id: @agreement_zone.id).where(extra_id: params[:extra_id]).first
    end
end
