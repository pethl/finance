class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :ticker
      t.boolean :vat
      t.integer :invtype_id

      t.timestamps
    end
  end
end
