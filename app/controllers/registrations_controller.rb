class RegistrationsController < Devise::RegistrationsController
	def create
		super
		if @user.id != nil
			p = Permission.new( user_id: @user.id, activo: false) 
			p.save
			@user.permission_id = p.id
			@user.save
		end
	end

	def destroy
		@user.destroy 
		@user.save
		redirect_to userlist_permissions_path 
	end
end
