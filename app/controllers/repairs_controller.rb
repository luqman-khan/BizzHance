class RepairsController < ApplicationController
  before_action :set_repair, only: [:show, :edit, :update, :destroy]
  before_action :set_customer

  # GET /repairs
  # GET /repairs.json
  def index
    @repairs = Repair.generate_repair_index(@organization,@customer)
    @new_path = @customer ? new_customer_repair_path(@customer) : new_repair_path
  end

  # GET /repairs/1
  # GET /repairs/1.json
  def show
  end

  # GET /repairs/new
  def new
      @repair = Repair.generate_new_repair(@organization, @customer)
      # @index_path = @customer ? customer_repairs_path : repairs_path
  end

  # GET /repairs/1/edit
  def edit
  end

  # POST /repairs
  # POST /repairs.json
  def create
    @repair = @organization.repairs.new(repair_params)
    respond_to do |format|
      if @repair.save!
        format.html { redirect_to @repair, notice: 'Repair was successfully created.' }
        format.json { render :show, status: :created, location: @repair }
      else
        format.html { render :new }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repairs/1
  # PATCH/PUT /repairs/1.json
  def update
    respond_to do |format|
      if @repair.update(repair_params)
        format.html { redirect_to @repair, notice: 'Repair was successfully updated.' }
        format.json { render :show, status: :ok, location: @repair }
      else
        format.html { render :edit }
        format.json { render json: @repair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairs/1
  # DELETE /repairs/1.json
  def destroy
    @repair.destroy
    respond_to do |format|
      format.html { redirect_to repairs_url, notice: 'Repair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair
      @repair = @organization.repairs.find(repair_params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      # @customer = Organization.find_customer_by_id(@organization, params[:customer_id])
      @customer = @organization.customers.find(params[:customer_id]) if params[:customer_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_params
      params.require(:repair).permit(:item_name, :problem_description, :item_condition, :repair_description, :charge_note, :data_saving, :total_charge, :user_id, :customer_id, :organization_id)
    end
end
