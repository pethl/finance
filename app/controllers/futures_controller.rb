class FuturesController < ApplicationController
  before_action :set_future, only: [:show, :edit, :update, :destroy]

  # GET /futures
  def index
    @futures = Future.all
  end

  # GET /futures/1
  def show
    @future_line_items = FutureLineItem.where(:future_id => @future)
  end

  # GET /futures/new
  def new
    @future = Future.new
  end

  # GET /futures/1/edit
  def edit
  end

  # POST /futures
  def create
    @future = Future.new(future_params)
       
    if @future.save
      count = (future_params[:years].to_i)-0
      rate = (future_params[:rate].to_f/100)
      lastval = Ammount.where(:account_id => (future_params[:account_id])).sort_by { |h| h[:date]}.reverse.first.ammount

      (0..count).each do |i|
        FutureLineItem.new(:future_id => @future.id, :year=>(Time.now.year+i), :ammount => lastval).save
        lastval = ((lastval.to_f*rate.to_f)+lastval)
      end
      redirect_to @future, notice: 'Future was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /futures/1
  def update
    if @future.update(future_params)
      redirect_to @future, notice: 'Future was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /futures/1
  def destroy
    @future.destroy
    redirect_to futures_url, notice: 'Future was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_future
      @future = Future.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def future_params
      params.require(:future).permit(:account_id, :years, :rate)
    end
    
end
