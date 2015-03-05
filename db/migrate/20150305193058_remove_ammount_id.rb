class RemoveAmmountId < ActiveRecord::Migration
  def change
    remove_column :accounts, :ammount_id
  end
end
