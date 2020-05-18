class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.integer :quantity
      t.float :unit_price

      t.timestamps

      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
    end
  end
end
