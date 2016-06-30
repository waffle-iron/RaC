# -*- coding: utf-8 -*-
class AgreementInsurancesController < AgreementBaseController
  before_action :set_agreement_insurance, only: [:add_remove]

  # Add Group to Agreement
  def add_remove
    if @agreement_insurance
      @agreement_insurance.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: :insurances) , status: :see_other, notice: 'Se ha eliminado con exito el Seguro del Acuerdo.'
    else
      AgreementZoneInsurance.create({agreement_id: @agreement.id, insurance_id: params[:insurance_id]})
        redirect_to edit_agreement_path(@agreement.id, anchor: :insurances) , status: :see_other, notice: 'Se ha agregado con exito el Seguro al Acuerdo.'
    end
  end

  private
    def set_agreement_insurance
      @agreement_insurance = AgreementZoneInsurance.where(agreement_id: @agreement.id).where(insurance_id: params[:insurance_id]).first
    end
end
