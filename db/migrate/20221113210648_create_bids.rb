class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|

      t.boolean :status, null: false, default: false
      t.datetime :approved_at

      t.timestamps
    end

    add_reference :bids, :worker, index: true
    add_reference :bids, :premium_for_score, index: true

  end
end
