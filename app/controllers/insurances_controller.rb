class InsurancesController < ApplicationController
  before_action :set_insurance, only: [:show, :edit, :update, :destroy]

  # GET /insurances
  def index
    @insurances = Insurance.all
  end

  # GET /insurances/1
  def show
  end

  # GET /insurances/new
  def new
    @insurance = Insurance.new
  end

  # GET /insurances/1/edit
  def edit
  end

  # POST /insurances
  def create
    @insurance = Insurance.new(insurance_params)

    if @insurance.save
      @insurance = Insurance.new
      #redirect_to insurances_url, notice: 'Insurance was successfully created.'
     flash[:notice] = 'Insurance was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /insurances/1
  def update
    if @insurance.update(insurance_params)
      redirect_to insurances_url, notice: 'Insurance was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /insurances/1
  def destroy
    @insurance.destroy
    redirect_to insurances_url, status: :see_other, notice: 'Insurance was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance
      @insurance = Insurance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def insurance_params
      params.require(:insurance).permit(:name)
    end
end
