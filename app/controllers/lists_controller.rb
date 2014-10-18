class ListsController < ApplicationController

	def index
		@lists = current_user.lists
		@list = List.new
	end

	def create
		@list = current_user.lists.new(list_params)
		@list.save

		redirect_to list_tasks_url(@list)
	end

	def destroy
		list = current_user.lists.find(params[:id])
	  list.destroy

	  redirect_to lists_url
	end

	def update
		list = current_user.lists.find(params[:id])
		list.update(:private => false)

		redirect_to lists_url
	end

	private
		def list_params
			params.require(:list).permit(:name, :user)
		end
end
