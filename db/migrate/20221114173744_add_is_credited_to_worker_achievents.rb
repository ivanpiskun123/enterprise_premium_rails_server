class AddIsCreditedToWorkerAchievents < ActiveRecord::Migration[6.1]
  def change
    add_column :worker_achievements, :is_credited, :boolean, null: false, default: false
  end
end
