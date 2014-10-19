class FavoriteListsController < ApplicationController

	def index
		favorite_lists = current_user.favorite_lists.pluck(:list_id)
		@lists = List.where(id: favorite_lists)
	end

	def create
		current_user.favorite_lists.find_or_create_by(list_id: params[:id])	
		redirect_to :back, notice: (t 'favorite_lists.form_favorite_success')
	end

	def update
		create
	end

end
