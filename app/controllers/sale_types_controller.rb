class SaleTypesController < ApplicationController
  before_action :set_sale_type, only: [:show, :edit, :update, :destroy]

  # GET /sale_types
  def index
    @sale_types = SaleType.all
  end

  # GET /sale_types/1
  def show
  end

  # GET /sale_types/new
  def new
    @sale_type = SaleType.new
  end

  # GET /sale_types/1/edit
  def edit
  end

  # POST /sale_types
  def create
    @sale_type = SaleType.new(sale_type_params)

    if @sale_type.save
      @sale_type = SaleType.new
      #redirect_to sale_types_url, notice: 'Sale type was successfully created.'
     flash[:notice] = 'Sale type was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /sale_types/1
  def update
    if @sale_type.update(sale_type_params)
      redirect_to sale_types_url, notice: 'Sale type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sale_types/1
  def destroy
    @sale_type.destroy
    redirect_to sale_types_url, status: :see_other, notice: 'Sale type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_type
      @sale_type = SaleType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sale_type_params
      params.require(:sale_type).permit(:name)
    end
end
