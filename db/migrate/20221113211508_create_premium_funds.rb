class CreatePremiumFunds < ActiveRecord::Migration[6.1]
  def change
    create_table :premium_funds do |t|

      t.integer :fund_amount, null: false, default: 0

      t.timestamps
    end
  end
end
