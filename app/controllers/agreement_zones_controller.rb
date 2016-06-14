# -*- coding: utf-8 -*-
class AgreementZonesController < ApplicationController
  before_action :set_agreement_zone, only: [:show, :edit, :add_remove_zone]
  before_action :redirect_if_agreement_zone_not_exist, only: [:show, :edit]

  def show
  end

  def edit
  end

  # Add Zone to agreements
  def add_remove_zone
    if @agreement_zone
      @agreement_zone.destroy
      redirect_to edit_agreement_path(params[:id]) , status: :see_other, notice: 'Se ha eliminado con exito la Zona del Acuerdo.'
    else
      AgreementZone.create({agreement_id: params[:id], zone_id: params[:zone_id]})
      redirect_to edit_agreement_path(params[:id]) , status: :see_other, notice: 'Se ha agregado con exito la Zona al Acuerdo.'
    end
  end

  private
    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: params[:id]).where(zone_id: params[:zone_id]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(params[:id]) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end
end
