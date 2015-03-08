class AddSharepriceToAmmount < ActiveRecord::Migration
  def change
    add_column :ammounts, :share_price, :decimal
  end
end
