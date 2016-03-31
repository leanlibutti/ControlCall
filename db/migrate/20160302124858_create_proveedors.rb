class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
