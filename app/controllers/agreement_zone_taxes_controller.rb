# -*- coding: utf-8 -*-
class AgreementZoneTaxesController < AgreementZoneBaseController
  before_action :set_agreement_zone_tax, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_tax
      @agreement_zone_tax.destroy
      redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :taxes) , status: :see_other, notice: 'Se ha eliminado con exito el Impuesto de la Zona del Acuerdo.'
    else
      AgreementZoneTax.create({agreement_zone_id: @agreement_zone.id, tax_id: params[:tax_id]})
        redirect_to edit_agreement_zone_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :taxes) , status: :see_other, notice: 'Se ha agregado con exito el Impuesto a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone_tax
      @agreement_zone_tax = AgreementZoneTax.where(agreement_zone_id: @agreement_zone.id).where(tax_id: params[:tax_id]).first
    end
end
