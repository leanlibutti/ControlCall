class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
#after_action :cambiar_ventana, if: :devise_controller?

def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:sector_id, :area_id, :password, :email, :internal, :name) }
end

#def cambiar_ventana
#	redirect_to edit_user_registration_path(@user.id)
#end 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
