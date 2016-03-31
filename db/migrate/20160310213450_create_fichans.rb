class CreateFichans < ActiveRecord::Migration
  def change
    create_table :fichans do |t|
      t.integer :code
      t.float :valor_sec_n
      t.float :valor_sec_r
      t.float :valor_min_n
      t.float :valor_min_r
      t.string :description

      t.timestamps null: false
    end
  end
end
