class CreateDeposits < ActiveRecord::Migration[6.0]
  def change
    create_table :deposits do |t|
      t.integer :deposit_number
      t.date :date_processed
      t.string :check_number
      t.integer :fellow_id
      t.integer :fellow_number
      t.date :check_date
      t.string :payment_by
      t.string :payment_type
      t.string :deposit_type
      t.monetize :gift_amount
      t.string :period
      t.monetize :amount
      t.string :last_name

      t.timestamps
    end
  end
end
