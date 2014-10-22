class TasksController < ApplicationController
	
	def index
		list
		@task = Task.new
		if @list.user == current_user || @list.is_public_list
			@tasks = @list.tasks.undone_order
		else
			head :unauthorized
		end	
	end

	def create   
 		list
 		@task = list.tasks.new(task_params)

  	@task.save
		respond_with @task, location: list_tasks_url(@list)
	end

	def destroy
		list
	  task = current_user.tasks.find(params[:id])
	  task.destroy

	  respond_with nil, location: list_tasks_url(@list)
	end

	def update
		list
		task = current_user.tasks.find(params[:id])
		task.update(:status => true)

		respond_with task, location: list_tasks_url(@list)
	end

	private
	
		def list
			@list ||= List.find(params[:list_id])
		end

		def task_params
			params.require(:task).permit(:title, :status, :list_id)
		end
end
