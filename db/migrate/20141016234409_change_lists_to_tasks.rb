class ChangeListsToTasks < ActiveRecord::Migration
  def change
  	rename_table :lists, :tasks
  end
end
