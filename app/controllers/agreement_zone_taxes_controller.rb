# -*- coding: utf-8 -*-
class AgreementZoneTaxesController < ApplicationController
  before_action :set_agreement_zone, only: [:add_remove]
  before_action :redirect_if_agreement_zone_not_exist, only: [:add_remove]
  before_action :set_agreement_zone_tax, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_tax
      @agreement_zone_tax.destroy
      redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :taxes) , status: :see_other, notice: 'Se ha eliminado con exito el Impuesto de la Zona del Acuerdo.'
    else
      AgreementZoneTax.create({agreement_zone_id: @agreement_zone.id, tax_id: params[:tax_id]})
        redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id, anchor: :taxes) , status: :see_other, notice: 'Se ha agregado con exito el Impuesto a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: params[:id]).where(zone_id: params[:zone_id]).first
    end

    def set_agreement_zone_tax
      @agreement_zone_tax = AgreementZoneTax.where(agreement_zone_id: @agreement_zone).where(tax_id: params[:tax_id]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(params[:id]) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end
end
