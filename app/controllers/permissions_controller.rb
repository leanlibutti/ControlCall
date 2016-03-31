class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  def usersregistrated   
    ini = params[:fechaini]
    fin = params[:fechafin]
    @registrados = User.where("? <= created_at AND created_at <= ? ",ini, fin)
    if (ini.blank?) ||  (ini < fin)
      flash[:notice] = "  "  
    elsif  (ini == fin) 
      flash[:notice] = "Las fechas no pueden ser iguales"
    else
      flash[:notice] = "La fecha final no pueden ser menor a la inicial"
    end
  end

  def listrecoveradmin

  end

  def recoveradmin
    user= User.find(id: @permission.user_id)
    contrasena= params[:contrasena]
    user.password= contrasena
    user.recover= false
    if user.save
      flash[:notice] = "La contraseña del usuario #{user.name} ha sido modificada"
      redirect_to root_path
    end
  end

  def recoverpassword
    current_user.recover = true 
    if current_user.save
      flash[:notice] = "Se ha enviado instruccion de recuperacion al administrador."
      redirect_to root_path 
  end

  # GET /permissions
  # GET /permissions.json
  def index
    @permissions = Permission.all
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
    @permission.activo = true
    @permission.save
    redirect_to permissions_path
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to @permission, notice: 'Permission was successfully created.' }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to permissions_path, notice: 'El permiso ha sido aceptado.' }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.activo= false
    @permission.save
    respond_to do |format|
      format.html { redirect_to permissions_path, notice: 'El permiso ha sido cancelado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:activo, :user_id)
    end



end
