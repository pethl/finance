class AmmountsController < ApplicationController
  before_action :set_ammount, only: [:show, :edit, :update, :destroy]
    
  # GET /ammounts
  def index
    @ammounts = Ammount.all
    @ammounts_this_month = Ammount.where(:date =>(Time.now.beginning_of_month..Time.now.end_of_month))
  end

  # GET /ammounts/1
  def show
  end

  # GET /ammounts/new
  def new
    @ammount = Ammount.new
  end

  # GET /ammounts/1/edit
  def edit
  end

  # POST /ammounts
  def create
    @ammount = Ammount.new(ammount_params)

    if @ammount.save
      redirect_to @ammount, notice: 'Ammount was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ammounts/1
  def update
    respond_to do |format|
            if @ammount.update(ammount_params)
               format.html {redirect_to @ammount, notice: 'Ammount was successfully updated.'}
               format.json { render json: @ammount}
            else
               format.html {render :edit}
               format.json {render :json => @ammount.errors.full_messages, :status => :unprocessable_entity }
            end
      end
  end

  # DELETE /ammounts/1
  def destroy
    @ammount.destroy
    redirect_to ammounts_url, notice: 'Ammount was successfully destroyed.'
  end
  
  def data_entry
    @accounts = Account.where(:status => 'Open')
    
    @accounts.each do |account|
    if account.ticker.blank?
      @ammount = Ammount.new(:date => Time.now, :account_id => account.id, :ammount => 0)
    else
      share_price = Account.get_share_price(account.ticker)
      share_price_gbp = GoogCurrency.usd_to_gbp(share_price)
      @ammount = Ammount.new(:date => Time.now, :account_id => account.id, :ammount => ((Account.get_share_count(account))*(share_price_gbp.to_f)), :share_price => (Account.get_share_price(account.ticker)))    
    end
        if @ammount.save
          #do nothing and continue
        else
          redirect_to ammounts_path, notice: "An error has occurred."
        end
    
    end
    redirect_to ammounts_path, notice: "Begin data capture." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ammount
      @ammount = Ammount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ammount_params
      params.require(:ammount).permit(:date, :ammount, :estimated, :account_id, :share_price)
    end
end
