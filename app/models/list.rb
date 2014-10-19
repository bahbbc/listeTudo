class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks , :dependent => :destroy
	has_many :favorite_lists, :dependent => :destroy

	validates :name, presence: true

	scope :public_list, -> { where(private: false) }

	def is_public_list
		self.private == false
	end
end
