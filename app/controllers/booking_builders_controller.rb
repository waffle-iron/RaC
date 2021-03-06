class BookingBuildersController < ApplicationController

  before_filter :load_ttoo, only: [:new, :new_select_insurances, :total, :create]
  before_filter :redirect_if_no_ttoo, only: [:new, :new_select_insurances, :total, :create]
  before_filter :load_agreement, only: [:new, :new_select_insurances, :total, :create]
  before_filter :load_agreement_zone, only: [:new, :new_select_insurances, :total, :create]


  # 1 - GET select_zone
  def select_zone
    @all_zones = Zone.order('parent_zone_id Desc')
    # todo: enhance with :is_active
    @included_zones = Agreement.includes(:agreement_zones).pluck("agreement_zones.zone_id")
    @link = select_ttoo_booking_builders_path(":id")

    # @link = '#' # agreement_zone_path(@agreement, ":id")
  end

  # 2 - GET select ttoo
  def select_ttoo
    @zone_id = params[:zone_id]
    tour_operator_company_type = 2

    ttoos = AgreementZone.joins(agreement: [:company]).where("companies.company_type_id = ?", tour_operator_company_type).where(zone_id: @zone_id).group("agreements.company_id").pluck("agreements.company_id")

    @ttoos = Company.where("id in (?)", ttoos).order(:name)
  end

  # 3 - Basic Booking Data
  def new
    new_booking
  end

  # 4 - Insurances
  def new_select_insurances
    @zone_id = params[:zone_id]
    @booking = Booking.new(booking_params)
    @booking.calculate_days
    build_extras
    build_insurances

    #@route = new_select_insurances_booking_builders_path(@zone_id, @ttoo)
    @route = total_booking_builders_path(@zone_id, @ttoo)
  end

  # 5 Total
  def total
    @zone_id = params[:zone_id]
    @booking = Booking.new(booking_params)
    @booking.current_offer = @agreement_zone.current_offer
    @booking.current_rate = @agreement_zone.current_rate

    @route = create_booking_builders_path(@zone_id, @ttoo)
  end

  # 6 Create
  def create
    @zone_id = params[:zone_id]
    @booking = Booking.new(booking_params)

    if @booking.save
      new_booking
      flash[:notice] = 'Se ha creado la reserva con exito.'
      render :new
    else
      render :new
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def booking_params
    customer_attributes = [:treatment_type_id, :first_name, :last_name, :nationality_id]
    booking_rate_extras_attributes = [:id, :booking_id, :quantity, :rate_extra_id]
    booking_insurances_attributes = [:id, :rate_group_insurance_cost_id, :booking_id, :include]


    params.require(:booking).permit(:agreement_zone_id, :total_extras, :total_insurances, :total_groups, :total_taxes, :total, :observations, :current_rate_id, :current_offer_id, :delivery_date, :delivery_location, :days_number, :return_date, :return_location, :ttoo_id, :rac_id, :group, :booking_number, :external_reference, :place_type, :place_name, :fly_room, :user_id, :rate_group_id, :place_type_id, customer_attributes: customer_attributes,  booking_rate_extras_attributes: booking_rate_extras_attributes, booking_insurances_attributes: booking_insurances_attributes)
  end

  def new_booking
    @zone_id = params[:zone_id]
    @booking = Booking.new({agreement_zone: @agreement_zone, tour_operator: @ttoo})
    build_customer
    build_groups

    @route = new_select_insurances_booking_builders_path(@zone_id, @ttoo)
  end

  def load_ttoo
    @ttoo = Company.where(id: params[:ttoo_id]).first
  end

  def load_agreement
    # todo: enhance with :is_active
    @agreement = Agreement.where(company_id: @ttoo.id).first
  end

  def load_agreement_zone
    @agreement_zone = AgreementZone.where(agreement_id: @agreement.id).where(zone_id: params[:zone_id]).first
  end

  def redirect_if_no_ttoo
    redirect_to select_zone_booking_builders_path, status: :see_other, notice: 'No se ha encontrado el Tour Operador!, Seleccione uno!' unless @ttoo
  end

  def load_rate
    @rate = @agreement_zone.get_rate
  end

  def build_extras
    # if booking_params &&  booking_params[:booking_rate_extras_attributes]
    #   booking_params[:booking_rate_extras_attributes].each do |p|
    #     @booking.booking_rate_extras.build({rate_extra_id: p[:rate_extra_id], booking_id: p[:booking_id], id: p[:id], quantity: p[:quantity]})
    #   end
    # else
    @agreement_zone.get_rate_extras.each do |rate_extra|
      @booking.booking_rate_extras.build(rate_extra: rate_extra)
    end
    # end
  end

  def build_customer
    build_params = {booking: @booking}
    # build_params.merge(booking_params[:customer_attributes]) if booking_params && booking_params[:customer_attributes]
    @booking.customer = Customer.new(build_params)
  end

  def build_groups
    @groups = @agreement_zone.get_rate_groups
  end

  def build_insurances
    @booking.get_rate_insurances.each do |rate_group_insurance_cost|
      @booking.booking_insurances.build({rate_group_insurance_cost: rate_group_insurance_cost, include: false})
    end
  end
end







