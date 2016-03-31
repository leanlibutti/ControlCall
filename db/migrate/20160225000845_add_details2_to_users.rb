class AddDetails2ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :area_id, :integer
    add_column :users, :sector_id, :integer
  end
end
