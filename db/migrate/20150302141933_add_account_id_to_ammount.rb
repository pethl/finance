class AddAccountIdToAmmount < ActiveRecord::Migration
  def change
    add_column :ammounts, :account_id, :integer
  end
end
