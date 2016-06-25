# -*- coding: utf-8 -*-
class AgreementGroupSectionsController < ApplicationController
  before_action :set_agreement, only: [:add_remove]
  before_action :redirect_if_agreement_not_exist, only: [:add_remove]
  before_action :set_agreement_group_section, only: [:add_remove]

  def add_remove
    if @agreement_group_section
      @agreement_group_section.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: :group_sections) , status: :see_other, notice: 'Se ha eliminado con exito el Tramo del Acuerdo.'
    else
      AgreementZoneGroupSection.create({agreement_id: @agreement.id,  section: params[:section]})
        redirect_to edit_agreement_path(@agreement.id, anchor: :group_sections) , status: :see_other, notice: 'Se ha agregado con exito el Tramo al Acuerdo.'
    end
  end

  private
    def set_agreement
      @agreement = Agreement.where(id: params[:id]).first
    end

    def set_agreement_group_section
      @agreement_group_section = AgreementZoneGroupSection.where(agreement_id: @agreement.id).where(section: params[:section]).first
    end

    def redirect_if_agreement_not_exist
      redirect_to agreements_path(params[:id]) , status: :see_other, notice: 'Acuerdo no existe' unless @agreement
    end
end
