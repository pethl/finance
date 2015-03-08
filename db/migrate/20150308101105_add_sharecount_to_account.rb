class AddSharecountToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :share_count, :integer    
  end
end
