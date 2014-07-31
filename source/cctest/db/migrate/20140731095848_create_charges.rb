class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id
      t.boolean :disputed

      t.timestamps
    end
    add_index :charges, :paid
    add_index :charges, :refunded
    add_index :charges, :customer_id
    add_index :charges, :disputed
  end
end
