class Constant < ActiveRecord::Base

	belongs_to :proveedor
	has_many :ficha_nacionals

end

