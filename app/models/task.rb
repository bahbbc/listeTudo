class Task < ActiveRecord::Base
	belongs_to :list
	 
	validates :title, presence: true

	scope :undone_order, -> {order ('status')}
end
