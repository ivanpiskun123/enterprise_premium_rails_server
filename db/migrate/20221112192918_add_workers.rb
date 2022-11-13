class AddWorkers < ActiveRecord::Migration[6.1]
  def up
    create_table :workers do |t|
      t.string "email", null: false, default: ""
      t.string "first_name", null: false, default: ""
      t.string "second_name", null: false, default: ""
      t.string "phone_number", null: true
      t.float "exp", null: false, default: 0
      t.index :email, unique: true

      t.timestamps
    end

    add_reference :workers, :position, foreign_key: true

  end

  def down
    drop_table :workers
  end
end
