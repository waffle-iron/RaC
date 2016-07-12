class BookingsController < AgreementBaseController
  before_action :set_agreement_zone
  before_action :redirect_if_agreement_zone_not_exist
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new(agreement_zone: @agreement_zone)
    @booking.customer = Customer.new(booking: @booking)
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking = Booking.new(agreement_zone: @agreement_zone)
      #redirect_to bookings_url, notice: 'Booking was successfully created.'
      flash[:notice] = 'Booking was successfully created.'
      render :new
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to bookings_url, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, status: :see_other, notice: 'Booking was successfully destroyed.'
  end

  def toolbar(mode)
    toolbar = Theme::Toolbar.new
    toolbar.add_button('Nuevo', new_agreement_zone_booking_path(@agreement, @agreement_zone), 'plus') if [:show, :index, :edit, :new].include?(mode)
    toolbar.add_button('Ver', agreement_zone_booking_path(@agreement, @agreement_zone, @booking), 'eye') if [:show, :edit].include?(mode)
    toolbar.add_button('Editar', edit_agreement_zone_booking_path(@agreement, @agreement_zone, @booking), 'edit') if [:show].include?(mode)
    toolbar.add_button('Lista', agreement_zone_bookings_path(@agreement, @agreement_zone), 'view-list-alt') if [:show, :index, :edit, :new].include?(mode)
    toolbar.add_button('Eliminar', agreement_zone_booking_path(@agreement, @agreement_zone, @booking), 'delete') if [:show, :edit].include?(mode)
    toolbar
  end

  helper_method :toolbar

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:agreement_zone_id, :delivery_date, :delivery_location, :days_number, :return_location, :ttoo_id, :rac_id, :agreement_zone_group_id, :booking_number, :external_reference, :place_type, :place_name, :fly_room, :user_id, :customer_id, :rate_group_id)
    end

    def set_agreement_zone
      @agreement_zone = AgreementZone.where(agreement_id: @agreement.id).where(id: params[:zone_id]).first
    end

    def redirect_if_agreement_zone_not_exist
      redirect_to agreement_path(@agreement.id), status: :see_other, notice: 'La Zona seleccionada no se ha agregado al Acuerdo. Edite el Acuerdo y agregue la zona' unless @agreement_zone
    end

    def build_rate
      agreement_zone_group = AgreementZoneGroup.find(booking_params[:agreement_zone_group_id])
      days = booking_params[:days_number]
      agreement_zone_group.rate_groups
      # buscar por la seccion
    end


end
