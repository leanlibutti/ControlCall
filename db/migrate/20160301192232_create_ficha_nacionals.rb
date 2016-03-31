class CreateFichaNacionals < ActiveRecord::Migration
  def change
    create_table :ficha_nacionals do |t|
      t.integer :code
      t.float :valor_seg_n
      t.integer :constante_id
      t.float	:valor_seg_r
      t.float	:valor_min_r
      t.float	:valor_min_n
      t.float	:description
      t.timestamps null: false
    end
  end
end
