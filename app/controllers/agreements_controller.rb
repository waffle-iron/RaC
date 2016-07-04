class AgreementsController < ApplicationController
  before_action :set_agreement, only: [:show, :edit, :update, :destroy]

  # GET /agreements
  def index
    @agreements = Agreement.all
  end

  # GET /agreements/1
  def show
  end

  # GET /agreements/new
  def new
    @agreement = Agreement.new
  end

  # GET /agreements/1/edit
  def edit
    @zones = @agreement.zones.includes(:zones)
  end

  # POST /agreements
  def create
    @agreement = Agreement.new(agreement_params)

    if @agreement.save
      @agreement = Agreement.new
      #redirect_to agreements_url, notice: 'Agreement was successfully created.'
     flash[:notice] = 'Agreement was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /agreements/1
  def update
    if @agreement.update(agreement_params)
      redirect_to agreements_url, notice: 'Agreement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /agreements/1
  def destroy
    @agreement.destroy
    redirect_to agreements_url, status: :see_other, notice: 'Agreement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agreement
      @agreement = Agreement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agreement_params
      params.require(:agreement).permit(:company_id,
        :start_date,
        :end_date,
        :commission_base)
    end
end
