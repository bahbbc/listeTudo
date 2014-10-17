class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def create   
		@tasks = Task.new(task_params)
 
  	@tasks.save
		redirect_to tasks_path
	end

	def destroy
	  @tasks = Task.find(params[:id])
	  @tasks.destroy
	 
	  redirect_to tasks_path
	end

	def edit 
		@task = Task.find(params[:id]) 
	end

	def update
		@task = Task.find(params[:id])
		@task.update(:status => true)

		redirect_to tasks_path
	end

	private
	def task_params
		params.require(:task).permit(:title, :status)
	end
end
