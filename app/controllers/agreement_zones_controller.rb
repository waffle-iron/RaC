# -*- coding: utf-8 -*-
class AgreementZonesController < AgreementBaseController
  before_action :set_zone
  before_action :set_agreement_zone
  before_action :redirect_if_zone_not_exist

  def show
  end

  def edit
  end

  # Add Zone to agreements
  def add_remove
    if @agreement_zone
      @agreement_zone.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: "zones") , status: :see_other, notice: 'Se ha eliminado con exito la Zona del Acuerdo.'
    else
      AgreementZone.create({agreement_id: @agreement.id, zone_id: @zone.id})
      redirect_to edit_agreement_path(@agreement.id, anchor: "zones") , status: :see_other, notice: 'Se ha agregado con exito la Zona al Acuerdo.'
    end
  end

  private
    def set_zone
      @zone = Zone.where(id: params[:zone_id] || params[:id]).first
    end

    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: @agreement.id).where(zone_id: @zone.id).first
    end

    def redirect_if_zone_not_exist
      redirect_to agreement_path(@agreement.id) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @zone
    end
end
