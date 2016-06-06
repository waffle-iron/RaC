class CompanyTypesController < ApplicationController
  before_action :set_company_type, only: [:show, :edit, :update, :destroy]

  # GET /company_types
  def index
    @company_types = CompanyType.all
  end

  # GET /company_types/1
  def show
  end

  # GET /company_types/new
  def new
    @company_type = CompanyType.new
  end

  # GET /company_types/1/edit
  def edit
  end

  # POST /company_types
  def create
    @company_type = CompanyType.new(company_type_params)

    if @company_type.save
      @company_type = CompanyType.new
      #redirect_to company_types_url, notice: 'Company type was successfully created.'
     flash[:notice] = 'Company type was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /company_types/1
  def update
    if @company_type.update(company_type_params)
      redirect_to company_types_url, notice: 'Company type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /company_types/1
  def destroy
    @company_type.destroy
    redirect_to company_types_url, status: :see_other, notice: 'Company type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_type
      @company_type = CompanyType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_type_params
      params.require(:company_type).permit(:name)
    end
end
