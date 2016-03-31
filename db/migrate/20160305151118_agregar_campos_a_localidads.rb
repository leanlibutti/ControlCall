class AgregarCamposALocalidads < ActiveRecord::Migration
  def change

  	  	add_column :localidads, :interurbano, :integer
  	  	rename_column :localidads, :code, :clave_nqn

  end
end
