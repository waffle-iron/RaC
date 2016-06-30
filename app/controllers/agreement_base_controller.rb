# -*- coding: utf-8 -*-
class AgreementBaseController < ApplicationController
  before_action :set_agreement
  before_action :redirect_if_agreement_not_exist

  protected
    def set_agreement
      @agreement = Agreement.where(id: params[:agreement_id]).first
    end

    def redirect_if_agreement_not_exist
      redirect_to agreements_path() , status: :see_other, notice: 'Acuerdo no existe' unless @agreement
    end
end
