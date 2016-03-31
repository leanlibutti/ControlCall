class ProovedorsController < ApplicationController
  before_action :set_proovedor, only: [:show, :edit, :update, :destroy]

  # GET /proovedors
  # GET /proovedors.json
  def index
    @proovedors = Proovedor.all
  end

  # GET /proovedors/1
  # GET /proovedors/1.json
  def show
  end

  # GET /proovedors/new
  def new
    @proovedor = Proovedor.new
  end

  # GET /proovedors/1/edit
  def edit
  end

  # POST /proovedors
  # POST /proovedors.json
  def create
    @proovedor = Proovedor.new(proovedor_params)

    respond_to do |format|
      if @proovedor.save
        format.html { redirect_to @proovedor, notice: 'Proovedor was successfully created.' }
        format.json { render :show, status: :created, location: @proovedor }
      else
        format.html { render :new }
        format.json { render json: @proovedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proovedors/1
  # PATCH/PUT /proovedors/1.json
  def update
    respond_to do |format|
      if @proovedor.update(proovedor_params)
        format.html { redirect_to @proovedor, notice: 'Proovedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @proovedor }
      else
        format.html { render :edit }
        format.json { render json: @proovedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proovedors/1
  # DELETE /proovedors/1.json
  def destroy
    @proovedor.destroy
    respond_to do |format|
      format.html { redirect_to proovedors_url, notice: 'Proovedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proovedor
      @proovedor = Proovedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proovedor_params
      params.require(:proovedor).permit(:name, :lines)
    end
end
