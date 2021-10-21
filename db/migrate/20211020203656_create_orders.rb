class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :device_model
      t.string :device_imei
      t.decimal :annual_price, precision: 15, scale: 2
      t.string :payment_installments
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
