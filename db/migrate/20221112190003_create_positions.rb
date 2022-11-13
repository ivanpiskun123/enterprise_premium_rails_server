class CreatePositions < ActiveRecord::Migration[6.1]
  def up
    create_table :positions do |t|
      t.string "name", null: false, default: ""
      t.timestamps
      t.index :name, unique: true
    end
  end


  def down
    drop_table :positions
  end

end
