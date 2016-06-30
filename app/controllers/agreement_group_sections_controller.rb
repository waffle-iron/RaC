# -*- coding: utf-8 -*-
class AgreementGroupSectionsController < AgreementBaseController
  include AgreementZoneGroupSectionConcern
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
    def set_agreement_group_section
      @agreement_group_section = AgreementZoneGroupSection.where(agreement_id: @agreement.id).where(section: params[:section]).first
    end

end
