class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
   
  # GET /accounts
  def index
    @accounts = Account.all
    @accounts_by_type = @accounts.group_by { |t| t.invtype_id }
  end

  # GET /accounts/1
  def show
    @ammounts = Ammount.where(:account_id => @account).map { |p| {ammount: p.ammount, date: p.date} }
    @graph_ammounts = graph_data(@ammounts)
   
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:name, :ticker, :vat, :invtype_id)
    end
    
    def graph_data(ammounts)
      graph_amnt= []
       ammounts.each do |ammount|
          graph_amnt << [ammount[:date], ammount[:ammount]]
        end
      return graph_amnt
      end
end
