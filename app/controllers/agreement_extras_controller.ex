# -*- coding: utf-8 -*-
class AgreementExtrasController < ApplicationController
  before_action :set_agreement, only: [:add_remove]
  before_action :redirect_if_agreement_not_exist, only: [:add_remove]
  before_action :set_agreement_extra, only: [:add_remove]

  # Add Group to Agreement Zone
  def add_remove
    if @agreement_extra
      @agreement_extra.destroy
      redirect_to edit_agreement_path(@agreement.id, anchor: :extras) , status: :see_other, notice: 'Se ha eliminado con exito el Extra del Acuerdo.'
    else
      AgreementZoneExtra.create({agreement_id: @agreement.id, extra_id: params[:extra_id]})
        redirect_to edit_agreements_path(@agreement.id, anchor: :extras) , status: :see_other, notice: 'Se ha agregado con exito el Extra al Acuerdo.'
    end
  end

  private
    def set_agreement
      @agreement = Agreement.where(agreement_id: params[:id]).first
    end

    def set_agreement_extra
      @agreement_extra = AgreementZoneExtra.where(agreement_id: @agreement.id).where(extra_id: params[:extra_id]).first
    end

    def redirect_if_agreement_not_exist
      redirect_to agreement_path(params[:id]) , status: :see_other, notice: 'Acuerdo no existe' unless @agreement
    end
end
