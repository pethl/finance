class InvtypesController < ApplicationController
  before_action :set_invtype, only: [:show, :edit, :update, :destroy]

  # GET /invtypes
  def index
    @invtypes = Invtype.all
  end

  # GET /invtypes/1
  def show
  end

  # GET /invtypes/new
  def new
    @invtype = Invtype.new
  end

  # GET /invtypes/1/edit
  def edit
  end

  # POST /invtypes
  def create
    @invtype = Invtype.new(invtype_params)

    if @invtype.save
      redirect_to @invtype, notice: 'Invtype was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /invtypes/1
  def update
    if @invtype.update(invtype_params)
      redirect_to @invtype, notice: 'Invtype was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invtypes/1
  def destroy
    @invtype.destroy
    redirect_to invtypes_url, notice: 'Invtype was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invtype
      @invtype = Invtype.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invtype_params
      params.require(:invtype).permit(:name)
    end
end
