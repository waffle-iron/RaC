# -*- coding: utf-8 -*-
class AgreementTaxesController < AgreementBaseController
  before_action :set_agreement_tax, only: [:add_remove]

  # Add Group to Agreement
  def add_remove
    if @agreement_tax
      @agreement_tax.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: :taxes) , status: :see_other, notice: 'Se ha eliminado con exito el Impuesto del Acuerdo.'
    else
      AgreementZoneTax.create({agreement_id: @agreement.id, tax_id: params[:tax_id]})
        redirect_to edit_agreement_path(@agreement.id, anchor: :taxes) , status: :see_other, notice: 'Se ha agregado con exito el Impuesto al Acuerdo.'
    end
  end

  private
    def set_agreement_tax
      @agreement_tax = AgreementZoneTax.where(agreement_id: @agreement.id).where(tax_id: params[:tax_id]).first
    end
end
