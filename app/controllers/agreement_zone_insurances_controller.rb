# -*- coding: utf-8 -*-
class AgreementZoneInsurancesController < ApplicationController
  before_action :set_agreement_zone, only: [:add_remove]
  before_action :redirect_if_agreement_zone_not_exist, only: [:add_remove]
  before_action :set_agreement_zone_insurance, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_insurance
      @agreement_zone_insurance.destroy
      redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id) , status: :see_other, notice: 'Se ha eliminado con exito el Seguro de la Zona del Acuerdo.'
    else
      AgreementZoneInsurance.create({agreement_zone_id: @agreement_zone.id, insurance_id: params[:insurance_id]})
        redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id) , status: :see_other, notice: 'Se ha agregado con exito el Seguro a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: params[:id]).where(zone_id: params[:zone_id]).first
    end

    def set_agreement_zone_insurance
      @agreement_zone_insurance = AgreementZoneInsurance.where(agreement_zone_id: @agreement_zone).where(insurance_id: params[:insurance_id]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(params[:id]) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end
end
