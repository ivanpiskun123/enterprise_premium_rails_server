class CreateWorkerAchievements < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_achievements do |t|
      t.timestamps
    end
    add_reference :worker_achievements, :achievement, index: true
    add_reference :worker_achievements, :worker, index: true
  end
end
