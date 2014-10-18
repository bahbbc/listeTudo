class PublicListsController < ApplicationController
	def index
		@lists = List.public_list
	end
end
