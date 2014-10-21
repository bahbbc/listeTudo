module TasksHelper

	def status_list(task)
		if task.status.present?  
			content_tag(:del, task.title)
		else
			task.title
		end	
	end
	
end