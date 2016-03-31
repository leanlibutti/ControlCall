class RemoveAreaFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :area, :string
    remove_column :users, :sector, :string
  end
end
