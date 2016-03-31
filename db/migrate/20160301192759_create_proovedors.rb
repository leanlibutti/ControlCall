class CreateProovedors < ActiveRecord::Migration
  def change
    create_table :proovedors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end