class BookingBuildersController < ApplicationController

  before_filter :load_ttoo, only: [:new]
  before_filter :redirect_if_no_ttoo, only: [:new]
  before_filter :load_agreement, only: [:new]
  before_filter :load_agreement_zone, only: [:new]

  # 1 - GET select_zone
  def select_zone
    @all_zones = Zone.order('parent_zone_id Desc')
    # todo: enhance with :is_active
    @included_zones = Agreement.includes(:agreement_zones).pluck( "agreement_zones.zone_id")
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
    @booking = Booking.new(agreement_zone: @agreement_zone)
    build_extras
    @booking.customer = Customer.new(booking: @booking)
    @groups = @agreement_zone.groups.order(:group)
    @route =  new_select_insurances_booking_builders_path
  end

  private
  # Only allow a trusted parameter "white list" through.
  def booking_params
    params.require(:booking).permit(:agreement_zone_id, :delivery_date, :delivery_location, :days_number, :return_location, :ttoo_id, :rac_id, :agreement_zone_group_id, :booking_number, :external_reference, :place_type, :place_name, :fly_room, :user_id, :customer_id, :rate_group_id)
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
    redirect_to select_zone_booking_builders_path , status: :see_other, notice: 'No se ha encontrado el Tour Operador!, Seleccione uno!' unless @ttoo
  end

  def load_rate
    @rate = @agreement_zone.get_rate
  end

  def build_extras
    @agreement_zone.get_rate_extras.each do |rate_extra|
      @booking.booking_rate_extras.build(rate_extra: rate_extra)
    end
  end
end