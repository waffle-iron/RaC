# -*- coding: utf-8 -*-
class AgreementZoneInsurancesController < AgreementZoneBaseController
  before_action :set_agreement_zone_insurance, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_insurance
      @agreement_zone_insurance.destroy
      redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :insurances) , status: :see_other, notice: 'Se ha eliminado con exito el Seguro de la Zona del Acuerdo.'
    else
      AgreementZoneInsurance.create({agreement_zone_id: @agreement_zone.id, insurance_id: params[:insurance_id]})
        redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :insurances) , status: :see_other, notice: 'Se ha agregado con exito el Seguro a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone_insurance
      @agreement_zone_insurance = AgreementZoneInsurance.where(agreement_zone_id: @agreement_zone.id).where(insurance_id: params[:insurance_id]).first
    end
end
