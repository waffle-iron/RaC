# -*- coding: utf-8 -*-
class AgreementZoneGroupsController < ApplicationController
  before_action :set_agreement_zone, only: [:add_remove_group]
  before_action :redirect_if_agreement_zone_not_exist, only: [:add_remove_group]
  before_action :set_agreement_zone_group, only: [:add_remove_group]

  # Add Group to Agreement Zone
  def add_remove_group
    if @agreement_zone_group
      @agreement_zone_group.delete
      redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id) , status: :see_other, notice: 'Se ha eliminado con exito el Grupo de la Zona del Acuerdo.'
    else
      AgreementZoneGroup.create({agreement_zone_id: @agreement_zone.id, group: params[:group_letter]})
        redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id) , status: :see_other, notice: 'Se ha agregado con exito el Grupo a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: params[:id]).where(zone_id: params[:zone_id]).first
    end

    def set_agreement_zone_group
      @agreement_zone_group = AgreementZoneGroup.where(agreement_zone_id: @agreement_zone).where(group: params[:group_letter]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(params[:id]) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end
end
