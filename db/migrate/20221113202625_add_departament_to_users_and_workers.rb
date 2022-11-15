class AddDepartamentToUsersAndWorkers < ActiveRecord::Migration[6.1]
  def change
    add_reference :workers, :departament, index: true
    add_reference :users, :departament, index: true
  end
end
