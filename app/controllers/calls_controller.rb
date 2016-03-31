require "prawn"

class CallsController < ApplicationController
  before_action :set_call, only: [:show, :edit, :update, :destroy]


=begin
  def search
    @tipo = params[:tipo]
    @destino = params[:destino]
    if (current_user.admin?)
      @area = params[:area]
      @sector = params[:sector]
      @interno = params[:interno]
    else 
      @area= current_user.area
      @sector= current_user.sector
      @interno = current_user.internal
    end
    ini = params[:fechaini]
    fin = params[:fechafin]
    if (ini > fin)
      flash[:notice] = "La fecha inicial no puede ser mayor a la final"
    elsif ((!interno.blank?) && (sector.blank?)) || ((!interno.blank?) && (area.blank?))
      flash[:notice] = "Si se ingresa un interno debe ingresar el sector y area"
    elsif (Area.where(name: @area).count == 0) && (!@area.blank?)
      flash[:notice] = "El area ingresada no es correcta"
    elsif (Sector.where(name: @sector).count == 0) && (!@sector.blank?)
      flash[:notice] = "El sector ingresado no es correcta"
    else
      @calls = Call.where("? <= created_at AND created_at <= ? ",ini, fin)
    end
  end

=end


  def search


  end

  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call = Call.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello World"
        send_data pdf.render, filename: "llamada: #{@call.id}.pdf",
                            type: "application/pdf",
                            disposition: "inline"

      end
    end

  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:incoming, :outgoing, :call_date, :call_time, :extension, :dial_number, :ring, :duration, :acc_code, :cd, :cost)
    end
end
