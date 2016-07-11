class NationalitiesController < ApplicationController
  before_action :set_nationality, only: [:show, :edit, :update, :destroy]

  # GET /nationalities
  def index
    @nationalities = Nationality.all
  end

  # GET /nationalities/1
  def show
  end

  # GET /nationalities/new
  def new
    @nationality = Nationality.new
  end

  # GET /nationalities/1/edit
  def edit
  end

  # POST /nationalities
  def create
    @nationality = Nationality.new(nationality_params)

    if @nationality.save
      @nationality = Nationality.new
      #redirect_to nationalities_url, notice: 'Nationality was successfully created.'
     flash[:notice] = 'Nationality was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /nationalities/1
  def update
    if @nationality.update(nationality_params)
      redirect_to nationalities_url, notice: 'Nationality was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /nationalities/1
  def destroy
    @nationality.destroy
    redirect_to nationalities_url, status: :see_other, notice: 'Nationality was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nationality
      @nationality = Nationality.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def nationality_params
      params.require(:nationality).permit(:name)
    end
end
