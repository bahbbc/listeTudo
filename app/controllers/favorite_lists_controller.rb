class FavoriteListsController < ApplicationController

	def index
		favorite_lists = current_user.favorite_lists.pluck(:list_id)
		@lists = List.where(id: favorite_lists)
	end

	def create
		favorite_list = current_user.favorite_lists.find_or_create_by(list_id: params[:id])	
		respond_with favorite_list, location: request.referer, notice: (t 'favorite_lists.form_favorite_success')
	end

	def update
		create
	end

end
