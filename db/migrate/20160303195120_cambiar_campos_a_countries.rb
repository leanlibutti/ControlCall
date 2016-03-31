class CambiarCamposACountries < ActiveRecord::Migration
  def change
  	remove_column :countries, :coef, :integer
  	add_column :countries, :coef_n1, :float
  	add_column :countries, :coef_n2, :float
  	add_column :countries, :coef_r1, :float
  	add_column :countries, :coef_r2, :float

  end
end
