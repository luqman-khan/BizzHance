class RepairsController < ApplicationController
  before_action :set_repair, only: [:show, :edit, :update, :destroy]
  before_action :set_customer
  before_action :set_customers, only: [:new, :edit]
  before_action :set_read_only, only: [:new, :edit]

  # GET /repairs
  # GET /repairs.json
  def index
    @repairs = Repair.includes(:customer, :user).generate_repair_index(@organization,@customer)
    @new_path = @customer ? new_customer_repair_path(@customer) : new_repair_path
  end

  # GET /repairs/1
  # GET /repairs/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render @repair.generate_repair_pdf
      end
    end
  end

  # GET /repairs/new
  def new
    @repair = Repair.includes(:customer).generate_new_repair(@organization, @customer)
  end

  # GET /repairs/1/edit
  def edit
  end

  # POST /repairs
  # POST /repairs.json
  def create
    @repair = @organization.repairs.new(repair_params.merge(user_id: current_user.id, repair_number: Organization.get_next_repair_number(@organization),
      date_of_repair: DateTime.now))
    respond_to do |format|
      if @repair.save!
        format.html { redirect_to customer_repair_path(@repair.customer, @repair), notice: 'Repair was successfully created.' }
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
        format.html { redirect_to customer_repair_path(@repair.customer, @repair), notice: 'Repair was successfully updated.' }
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
      format.html { redirect_to (@customer ? customer_repairs_url(@customer) : repairs_url), notice: 'Repair was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair
      @repair = @organization.repairs.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = @organization.customers.find(params[:customer_id]) if params[:customer_id]
    end

    def set_customers
      @customers = @customer ? [@customer] : @organization.customers
    end

    def set_read_only
      @read_only = @customer ? true : false
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repair_params
      params.require(:repair).permit(:item_name, :problem_description, :item_condition, :repair_description, :charge_note, :data_saving, :total_charge, :user_id, :customer_id, :organization_id)
    end
end
