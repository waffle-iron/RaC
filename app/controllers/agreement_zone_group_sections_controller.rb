# -*- coding: utf-8 -*-
class AgreementZoneGroupSectionsController < ApplicationController
  before_action :set_agreement_zone, only: [:add_remove]
  before_action :redirect_if_agreement_zone_not_exist, only: [:add_remove]
  before_action :set_agreement_zone_group_section, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_zone_group_section
      @agreement_zone_group_section.destroy
      redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id) , status: :see_other, notice: 'Se ha eliminado con exito el Tramo de la Zona del Acuerdo.'
    else
      AgreementZoneGroupSection.create({agreement_zone_id: @agreement_zone.id, section: params[:section]})
        redirect_to edit_agreement_zones_path(@agreement_zone.agreement_id, @agreement_zone.zone_id) , status: :see_other, notice: 'Se ha agregado con exito el Tramo a la Zona del Acuerdo.'
    end
  end

  private
    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: params[:id]).where(zone_id: params[:zone_id]).first
    end

    def set_agreement_zone_group_section
      @agreement_zone_group_section = AgreementZoneGroupSection.where(agreement_zone_id: @agreement_zone).where(section: params[:section]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(params[:id]) , status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end
end
