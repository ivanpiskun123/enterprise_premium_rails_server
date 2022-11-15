class CreateWorkerImages < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_images do |t|
      t.string :image_url, null: false
      t.references  :reference, type: :bigint, polymorphic: true, index: true
      t.timestamps
    end
  end
end
