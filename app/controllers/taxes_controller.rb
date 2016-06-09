class TaxesController < ApplicationController
  before_action :set_tax, only: [:show, :edit, :update, :destroy]

  # GET /taxes
  def index
    @taxes = Tax.all
  end

  # GET /taxes/1
  def show
  end

  # GET /taxes/new
  def new
    @tax = Tax.new
  end

  # GET /taxes/1/edit
  def edit
  end

  # POST /taxes
  def create
    @tax = Tax.new(tax_params)

    if @tax.save
      @tax = Tax.new
      #redirect_to taxes_url, notice: 'Tax was successfully created.'
     flash[:notice] = 'Tax was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /taxes/1
  def update
    if @tax.update(tax_params)
      redirect_to taxes_url, notice: 'Tax was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /taxes/1
  def destroy
    @tax.destroy
    redirect_to taxes_url, status: :see_other, notice: 'Tax was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax
      @tax = Tax.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tax_params
      params.require(:tax).permit(:name)
    end
end
