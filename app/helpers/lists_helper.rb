module ListsHelper

	def list_privacy(list)
		list.private ? 'Privada' : 'Pública'
	end

	def belongs_to_user(list)
		list.user == current_user
	end
end
