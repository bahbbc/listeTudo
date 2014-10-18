class ListsController < ApplicationController
	def index
		@lists = current_user.lists
	end

	def create
		@list = current_user.lists.new(params[:list])
	end

	def destroy
	end

	private
		def list_params
			params.require(:list).permit(:name, :user)
		end
end
