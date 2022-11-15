class CreatePremiumForScores < ActiveRecord::Migration[6.1]
  def change
    create_table :premium_for_scores do |t|

      t.integer :amount, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end
