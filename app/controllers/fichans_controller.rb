class FichansController < ApplicationController
  before_action :set_fichan, only: [:show, :edit, :update, :destroy]

  # GET /fichans
  # GET /fichans.json
  def index
    @fichans = Fichan.all
  end

  # GET /fichans/1
  # GET /fichans/1.json
  def show
  end

  # GET /fichans/new
  def new
    @fichan = Fichan.new
  end

  # GET /fichans/1/edit
  def edit
  end

  # POST /fichans
  # POST /fichans.json
  def create
    @fichan = Fichan.new(fichan_params)

    respond_to do |format|
      if @fichan.save
        format.html { redirect_to @fichan, notice: 'Fichan was successfully created.' }
        format.json { render :show, status: :created, location: @fichan }
      else
        format.html { render :new }
        format.json { render json: @fichan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fichans/1
  # PATCH/PUT /fichans/1.json
  def update
    respond_to do |format|
      if @fichan.update(fichan_params)
        format.html { redirect_to @fichan, notice: 'Fichan was successfully updated.' }
        format.json { render :show, status: :ok, location: @fichan }
      else
        format.html { render :edit }
        format.json { render json: @fichan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fichans/1
  # DELETE /fichans/1.json
  def destroy
    @fichan.destroy
    respond_to do |format|
      format.html { redirect_to fichans_url, notice: 'Fichan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fichan
      @fichan = Fichan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fichan_params
      params.require(:fichan).permit(:code, :valor_sec_n, :valor_sec_r, :valor_min_n, :valor_min_r, :description)
    end
end
