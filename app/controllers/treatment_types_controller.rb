class TreatmentTypesController < ApplicationController
  before_action :set_treatment_type, only: [:show, :edit, :update, :destroy]

  # GET /treatment_types
  def index
    @treatment_types = TreatmentType.all
  end

  # GET /treatment_types/1
  def show
  end

  # GET /treatment_types/new
  def new
    @treatment_type = TreatmentType.new
  end

  # GET /treatment_types/1/edit
  def edit
  end

  # POST /treatment_types
  def create
    @treatment_type = TreatmentType.new(treatment_type_params)

    if @treatment_type.save
      @treatment_type = TreatmentType.new
      #redirect_to treatment_types_url, notice: 'Treatment type was successfully created.'
     flash[:notice] = 'Treatment type was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /treatment_types/1
  def update
    if @treatment_type.update(treatment_type_params)
      redirect_to treatment_types_url, notice: 'Treatment type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /treatment_types/1
  def destroy
    @treatment_type.destroy
    redirect_to treatment_types_url, status: :see_other, notice: 'Treatment type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_type
      @treatment_type = TreatmentType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def treatment_type_params
      params.require(:treatment_type).permit(:name)
    end
end
