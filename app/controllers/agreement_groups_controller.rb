# -*- coding: utf-8 -*-
class AgreementGroupsController < AgreementBaseController
  before_action :set_agreement_group, only: [:add_remove]

  # Add Group to Agreement
  def add_remove
    if @agreement_group
      @agreement_group.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: :groups) , status: :see_other, notice: 'Se ha eliminado con exito el Grupo del Acuerdo.'
    else
      AgreementZoneGroup.create({agreement_id: @agreement.id, group: params[:group_letter]})
        redirect_to edit_agreement_path(@agreement.id, anchor: :groups) , status: :see_other, notice: 'Se ha agregado con exito el Grupo al Acuerdo.'
    end
  end

  private
    def set_agreement_group
      @agreement_group = AgreementZoneGroup.where(agreement_id: @agreement.id).where(group: params[:group_letter]).first
    end
end
