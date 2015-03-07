class CreateFutures < ActiveRecord::Migration
  def change
    create_table :futures do |t|
      t.integer :account_id
      t.integer :years
      t.decimal :rate

      t.timestamps
    end
  end
end
