class AddAcccodeToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :acc_code, :double
  end
end
