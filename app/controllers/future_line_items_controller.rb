class FutureLineItemsController < ApplicationController
  before_action :set_future_line_item, only: [:show, :edit, :update, :destroy]

  # GET /future_line_items
  def index
    @future_line_items = FutureLineItem.all
  end

  # GET /future_line_items/1
  def show
  end

  # GET /future_line_items/new
  def new
    @future_line_item = FutureLineItem.new
  end

  # GET /future_line_items/1/edit
  def edit
  end

  # POST /future_line_items
  def create
    @future_line_item = FutureLineItem.new(future_line_item_params)

    if @future_line_item.save
      redirect_to @future_line_item, notice: 'Future line item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /future_line_items/1
  def update
    if @future_line_item.update(future_line_item_params)
      redirect_to @future_line_item, notice: 'Future line item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /future_line_items/1
  def destroy
    @future_line_item.destroy
    redirect_to future_line_items_url, notice: 'Future line item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_future_line_item
      @future_line_item = FutureLineItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def future_line_item_params
      params.require(:future_line_item).permit(:future_id, :year, :ammount)
    end
end
