class BookingsController < ApplicationController
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
    @booking = Booking.new
    @booking.customer = Customer.new(booking: @booking)
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking = Booking.new
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:zone_id, :delivery_date, :delivery_location, :days_number, :return_location, :ttoo_id, :rac_id, :agreement_zone_group_id, :booking_number, :external_reference, :place_type, :place_name, :fly_room, :user_id, :customer_id)
    end
end
