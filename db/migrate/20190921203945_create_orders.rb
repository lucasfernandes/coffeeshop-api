class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :coffeeName
      t.decima :total
      t.string :size

      t.timestamps
    end
  end
end
