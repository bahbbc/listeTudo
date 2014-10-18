class AddListIdToTask < ActiveRecord::Migration
  def change
  	add_reference :tasks, :list
  end
end
