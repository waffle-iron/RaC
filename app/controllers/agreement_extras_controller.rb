# -*- coding: utf-8 -*-
class AgreementExtrasController < AgreementBaseController
  before_action :set_agreement_extra, only: [:add_remove]

  # Add Group to Agreement
  def add_remove
    if @agreement_extra
      @agreement_extra.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: :extras) , status: :see_other, notice: 'Se ha eliminado con exito el Extra del Acuerdo.'
    else
      AgreementZoneExtra.create({agreement_id: @agreement.id, extra_id: params[:extra_id]})
        redirect_to edit_agreement_path(@agreement.id, anchor: :extras) , status: :see_other, notice: 'Se ha agregado con exito el Extra al Acuerdo.'
    end
  end

  private
    def set_agreement_extra
      @agreement_extra = AgreementZoneExtra.where(agreement_id: @agreement.id).where(extra_id: params[:extra_id]).first
    end
end
