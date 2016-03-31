class FichaNacionalsController < ApplicationController
  before_action :set_ficha_nacional, only: [:show, :edit, :update, :destroy]

  # GET /ficha_nacionals
  # GET /ficha_nacionals.json
  def index
    @ficha_nacionals = FichaNacional.all
  end

  # GET /ficha_nacionals/1
  # GET /ficha_nacionals/1.json
  def show
  end

  # GET /ficha_nacionals/new
  def new
    @ficha_nacional = FichaNacional.new
  end

  # GET /ficha_nacionals/1/edit
  def edit
  end

  # POST /ficha_nacionals
  # POST /ficha_nacionals.json
  def create
    @ficha_nacional = FichaNacional.new(ficha_nacional_params)

    respond_to do |format|
      if @ficha_nacional.save
        format.html { redirect_to @ficha_nacional, notice: 'Ficha nacional was successfully created.' }
        format.json { render :show, status: :created, location: @ficha_nacional }
      else
        format.html { render :new }
        format.json { render json: @ficha_nacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ficha_nacionals/1
  # PATCH/PUT /ficha_nacionals/1.json
  def update
    respond_to do |format|
      if @ficha_nacional.update(ficha_nacional_params)
        format.html { redirect_to @ficha_nacional, notice: 'Ficha nacional was successfully updated.' }
        format.json { render :show, status: :ok, location: @ficha_nacional }
      else
        format.html { render :edit }
        format.json { render json: @ficha_nacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ficha_nacionals/1
  # DELETE /ficha_nacionals/1.json
  def destroy
    @ficha_nacional.destroy
    respond_to do |format|
      format.html { redirect_to ficha_nacionals_url, notice: 'Ficha nacional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ficha_nacional
      @ficha_nacional = FichaNacional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ficha_nacional_params
      params.require(:ficha_nacional).permit(:code, :valor_seg, :valor_min, :constante_id)
    end
end
