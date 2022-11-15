class AddUserToBids < ActiveRecord::Migration[6.1]
  def change
    add_reference :bids, :user, index: true
  end
end
