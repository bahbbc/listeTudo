class TasksController < ApplicationController
	
	def index
		list
		@task = Task.new
		if @list.user == current_user || @list.is_public_list
			@tasks = @list.tasks 
		else
			head :unauthorized
		end	
	end

	def create   
 		list
 		task = list.tasks.new(task_params)

  	task.save
		redirect_to list_tasks_url(@list)
	end

	def destroy
		list
	  task = current_user.tasks.find(params[:id])
	  task.destroy

	  redirect_to list_tasks_url(@list)
	end

	def edit 
		@task = current_user.tasks.find(params[:id]) 
	end

	def update
		list
		task = current_user.tasks.find(params[:id])
		task.update(:status => true)

		redirect_to list_tasks_url(@list)
	end

	private
	
		def list
			@list ||= List.find(params[:list_id])
		end

		def task_params
			params.require(:task).permit(:title, :status, :list_id)
		end
end
