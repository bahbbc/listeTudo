class ListsController < ApplicationController

	def index
		@lists = current_user.lists
		@list = List.new
	end

	def create
		@list = current_user.lists.new(list_params)
		@list.save

		respond_with @list, location: lists_url
	end

	def destroy
		list = current_user.lists.find(params[:id])
	  list.destroy

	  respond_with nil, location: request.referer
	end

	def update
		list = current_user.lists.find(params[:id])
		list.update(:private => false)
		respond_with list, location: request.referer, notice: (t 'public_lists.form_public_success', list_name: list.name)
	end

	private
		def list_params
			params.require(:list).permit(:name, :user)
		end
end
