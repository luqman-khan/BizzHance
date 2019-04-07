class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :set_customer
  before_action :set_customers, only: [:new, :edit]
  before_action :set_read_only, only: [:new, :edit]

  # GET /sales
  # GET /sales.json
  def index
    @sales= Sale.includes(:customer, :user).generate_sale_index(@organization,@customer)
    @new_path = @customer ? new_customer_sale_path(@customer) : new_sale_path
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.includes(:customer).generate_new_sale(@organization, @customer)
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = @organization.sales.new(sale_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @sale.save!
        format.html { redirect_to customer_sale_path(@sale.customer,@sale), notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to customer_sale_path(@sale.customer,@sale), notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to (@customer ? customer_sales_url(@customer) : sales_url), notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = @organization.sales.find(params[:id])
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
    def sale_params
      params.require(:sale).permit(:item_sold, :item_price, :note, :date_of_sale, :user_id, :customer_id)
    end
end
