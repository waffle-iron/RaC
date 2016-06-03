class TypeCategoriesController < ApplicationController
  before_action :set_type_category, only: [:show, :edit, :update, :destroy]

  # GET /type_categories
  def index
    @type_categories = TypeCategory.all
  end

  # GET /type_categories/1
  def show
  end

  # GET /type_categories/new
  def new
    @type_category = TypeCategory.new
  end

  # GET /type_categories/1/edit
  def edit
  end

  # POST /type_categories
  def create
    @type_category = TypeCategory.new(type_category_params)

    if @type_category.save
      @type_category = TypeCategory.new
      #redirect_to type_categories_url, notice: 'Type category was successfully created.'
     flash[:notice] = 'Type category was successfully created.'
     render :new
    else
      render :new
    end
  end

  # PATCH/PUT /type_categories/1
  def update
    if @type_category.update(type_category_params)
      redirect_to type_categories_url, notice: 'Type category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /type_categories/1
  def destroy
    @type_category.destroy
    redirect_to type_categories_url, status: :see_other, notice: 'Type category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_category
      @type_category = TypeCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_category_params
      params.require(:type_category).permit(:name)
    end
end
