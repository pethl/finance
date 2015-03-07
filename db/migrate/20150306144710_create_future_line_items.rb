class CreateFutureLineItems < ActiveRecord::Migration
  def change
    create_table :future_line_items do |t|
      t.integer :future_id
      t.integer :year
      t.decimal :ammount

      t.timestamps
    end
  end
end
