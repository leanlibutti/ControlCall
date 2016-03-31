class CreateLocalidads < ActiveRecord::Migration
  def change
    create_table :localidads do |t|
      t.string :name
      t.integer :code

      t.timestamps null: false
    end
  end
end
