class CreateAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :achievements do |t|

      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""

      t.integer :points

      t.timestamps
    end
  end
end
