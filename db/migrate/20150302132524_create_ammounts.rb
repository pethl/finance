class CreateAmmounts < ActiveRecord::Migration
  def change
    create_table :ammounts do |t|
      t.date :date
      t.decimal :ammount
      t.boolean :estimated

      t.timestamps
    end
  end
end
