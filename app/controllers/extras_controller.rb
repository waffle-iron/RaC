class ExtrasController < ApplicationController
  before_action :set_extra, only: [:show, :edit, :update, :destroy]

  # GET /extras
  def index
    @extras = Extra.all
  end

  # GET /extras/1
  def show
  end

  # GET /extras/new
  def new
    @extra = Extra.new
  end

  # GET /extras/1/edit
  def edit
  end

  # POST /extras
  def create
    @extra = Extra.new(extra_params)

    if @extra.save
      @extra = Extra.new
      #redirect_to extras_url, notice: 'Extra was successfully created.'
     flash[:notice] = 'Extra was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /extras/1
  def update
    if @extra.update(extra_params)
      redirect_to extras_url, notice: 'Extra was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /extras/1
  def destroy
    @extra.destroy
    redirect_to extras_url, status: :see_other, notice: 'Extra was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra
      @extra = Extra.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def extra_params
      params[:extra]
    end
end
