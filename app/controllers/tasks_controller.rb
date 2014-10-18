class TasksController < ApplicationController
	
	def index
		@tasks = current_user.tasks
		@list = List.find(params[:list_id])
		@task = Task.new
	end

	def create   
 		@list = List.find(params[:list_id])
 		@task = @list.tasks.new(task_params)

  	@task.save
		redirect_to list_tasks_url(@list)
	end

	def destroy
		@list = List.find(params[:list_id])
	  task = current_user.tasks.find(params[:id])
	  task.destroy

	  redirect_to list_tasks_url(@list)
	end

	def edit 
		@task = current_user.tasks.find(params[:id]) 
	end

	def update
		@list = List.find(params[:list_id])
		task = current_user.tasks.find(params[:id])
		task.update(:status => true)

		redirect_to list_tasks_url(@list)
	end

	private
		def task_params
			params.require(:task).permit(:title, :status, :list_id)
		end
end
