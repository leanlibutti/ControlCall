class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.boolean :activo
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
