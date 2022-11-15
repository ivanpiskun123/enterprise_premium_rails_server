class CreateDepartaments < ActiveRecord::Migration[6.1]
  def change
    create_table :departaments do |t|
      t.string :name, null: false ,default: ""
      t.text :description, null: false, default: ""
      t.timestamps
    end
  end
end
