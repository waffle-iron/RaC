# -*- coding: utf-8 -*-
class AgreementZoneBaseController < AgreementBaseController
  before_action :set_agreement_zone
  before_action :redirect_if_agreement_zone_not_exist

  protected
    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: @agreement.id).where(zone_id: params[:zone_id]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(@agreement.id) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end
end
