class CreateInvtypes < ActiveRecord::Migration
  def change
    create_table :invtypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
