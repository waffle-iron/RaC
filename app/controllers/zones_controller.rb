class ZonesController < ApplicationController
  before_action :set_zone, only: [:show, :edit, :update, :destroy]

  # GET /zones
  def index
    @zones = Zone.where(parent_zone_id: nil)
  end

  # GET /zones/1
  def show
  end

  # GET /zones/new
  def new
    @zone = Zone.new(parent_zone_id: params[:parent_zone_id])
  end

  # GET /zones/1/edit
  def edit
  end

  # POST /zones
  def create
    @zone = Zone.new(zone_params)

    if @zone.save
      @zone = Zone.new(parent_zone_id: @zone.parent_zone_id)
      #redirect_to zones_url, notice: 'Zone was successfully created.'
     flash[:notice] = 'Zone was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /zones/1
  def update
    if @zone.update(zone_params)
      redirect_to zones_url, notice: 'Zone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /zones/1
  def destroy
    @zone.destroy
    redirect_to zones_url, status: :see_other, notice: 'Zone was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zone_params
      params.require(:zone).permit(:name, :parent_zone_id)
    end
end
