class TypeCategoriesController < ApplicationController
  before_action :set_type_category, only: [:show, :edit, :update, :destroy]

  # GET /type_categories
  # GET /type_categories.json
  def index
    @type_categories = TypeCategory.all
  end

  # GET /type_categories/1
  # GET /type_categories/1.json
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
  # POST /type_categories.json
  def create
    @type_category = TypeCategory.new(type_category_params)

    respond_to do |format|
      if @type_category.save
        format.html { redirect_to @type_category, notice: 'Type category was successfully created.' }
        format.json { render :show, status: :created, location: @type_category }
      else
        format.html { render :new }
        format.json { render json: @type_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_categories/1
  # PATCH/PUT /type_categories/1.json
  def update
    respond_to do |format|
      if @type_category.update(type_category_params)
        format.html { redirect_to @type_category, notice: 'Type category was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_category }
      else
        format.html { render :edit }
        format.json { render json: @type_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_categories/1
  # DELETE /type_categories/1.json
  def destroy
    @type_category.destroy
    respond_to do |format|
      format.html { redirect_to type_categories_url, notice: 'Type category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_category
      @type_category = TypeCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_category_params
      params.require(:type_category).permit(:name)
    end
end
