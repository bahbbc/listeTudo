class AddStatusDefaultToTasks < ActiveRecord::Migration
  def change
  	change_column_default :tasks, :status, false
  	tasks_null = Task.where('status is NULL')
  	tasks_null.update_all(status: false)
  end
end
