class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  before_action :set_agreement
  before_action :set_agreement_zone
  before_action :build_toolbar, except: [:create, :update]
  before_action :set_rate_owner

  # GET /rates
  def index
    @rates = @rate_owner.rates
  end

  # GET /rates/1
  def show
  end

  # GET /rates/new
  def new
    new_rate
  end

  # GET /rates/1/edit
  def edit
  end

  # POST /rates
  def create
    @rate = Rate.new(rate_params)
    build_toolbar("new")
    if @rate.save
      # save_groups
      new_rate
      #redirect_to rates_url, notice: 'Rate was successfully created.'
      flash[:notice] = 'Rate was successfully created.'
      render :new
    else
      render :new
    end
  end

  # PATCH/PUT /rates/1
  def update
    if @rate.update(rate_params)
      redirect_to build_route(:index), notice: 'Rate was successfully updated.'
    else
      build_toolbar("edit")
      render :edit
    end
  end

  # DELETE /rates/1
  def destroy
    @rate.destroy
    redirect_to build_route(:index), status: :see_other, notice: 'Rate was successfully destroyed.'
  end

  private
    def new_rate
      @rate = Rate.new({agreement: @agreement, agreement_zone: @agreement_zone, commission_base: 0})
      build_groups
      build_insurances
      build_taxes
      build_extras
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = Rate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rate_params
      group_attributes = [:id, :rate_id, :agreement_zone_group_id, :agreement_zone_group_section_id, :cost, :_destroy]
      tax_attributes = [:id, :rate_id, :agreement_zone_tax_id, :cost, :include_in_cost, :_destroy]
      extra_attributes = [:id, :rate_id, :agreement_zone_extra_id, :cost, :max_cost, :include_in_cost, :_destroy]
      insurance_cost_attributes = [:id, :rate_group_insurance_id, :agreement_zone_insurance_id, :cost, :include_in_cost]

      insurance_attributes = [:id, :agreement_zone_group_id, :rate_id, costs_attributes: insurance_cost_attributes]

      params.require(:rate).permit(:code, :from, :to, :is_active, :is_offer, :commission_base, :agreement_zone_id, :sale_type_id, :agreement_id, groups_attributes: group_attributes, insurances_attributes: insurance_attributes, taxes_attributes: tax_attributes, extras_attributes: extra_attributes)
    end

    def set_agreement
      @agreement = Agreement.where(id: params[:agreement_id]).first
    end

    def set_agreement_zone
      @agreement_zone = AgreementZone.where(id: params[:zone_id]).first
    end

    def set_rate_owner
      @rate_owner = @agreement_zone || @agreement
    end

    def build_toolbar(current_action = nil)
      current_action = current_action || action_name
      @toolbar = Theme::Toolbar.new
      @toolbar.add_button 'Nuevo', build_route(:new), 'plus' if ["show", "edit", "index", "new"].include?(current_action)
      @toolbar.add_button 'Ver', build_route(:show), 'eye' if ["show", "edit"].include?(current_action)
      @toolbar.add_button 'Editar', build_route(:edit), 'edit' if ["show", "edit"].include?(current_action)
      @toolbar.add_button 'Lista', build_route(:index), 'view-list-alt' if ["show", "index", "edit", "new"].include?(current_action)
      @toolbar.add_button 'Eliminar', build_route(:delete), 'delete' if ["show", "edit"].include?(current_action)
    end

    def build_route(mode = nil, mark = nil)
      ret = nil

      unless mode
        case action_name
        when "new", "create"
          mode = :create
        when "edit", "update"
          mode = :update
        end
      end

      if @agreement_zone
        ret = case mode
              when :new
                new_agreement_zone_rate_path(@agreement, @agreement_zone)
              when :create, :index
                agreement_zone_rates_path(@agreement, @agreement_zone)
              when :edit
                edit_agreement_zone_rate_path(@agreement, @agreement_zone, mark || @rate)
              when :show, :update, :delete
                agreement_zone_rate_path(@agreement, @agreement_zone, mark || @rate)
              else
                nil
              end
      else
        ret = case mode
              when :new
                new_agreement_rate_path(@agreement)
              when :create, :index
                agreement_rates_path(@agreement)
              when :edit
                edit_agreement_rate_path(@agreement, mark || @rate)
              when :show, :update, :delete
                agreement_rate_path(@agreement, mark || @rate)
              else
                nil
              end
      end
      ret
    end

    helper_method :build_route

    def build_groups
      @rate_owner.groups.order(:group).each do |group|
        @rate_owner.group_sections.order(:section).each do |group_section|
          @rate.groups.build(agreement_zone_group: group, agreement_zone_group_section: group_section, cost: 0)
        end
      end
    end

    def build_insurances
      @rate_owner.groups.order(:group).each do |group|
        rate_insurance_group = @rate.insurances.build(agreement_zone_group: group)
        @rate_owner.insurances.includes(:insurance).order("insurances.name ASC").each do |insurance|
          rate_insurance_group.costs.build(agreement_zone_insurance: insurance, cost: 0, include_in_cost: false)
        end
      end
    end

    def build_taxes
      @rate_owner.taxes.includes(:tax).order("taxes.name").each do |tax|
        @rate.taxes.build(agreement_zone_tax: tax, include_in_cost: false, cost: 0)
      end
    end

    def build_extras
      @rate_owner.extras.includes(:extra).order("extras.name").each do |extra|
        @rate.extras.build(agreement_zone_extra: extra, include_in_cost: false, cost: 0, max_cost: 0)
      end
    end
end
