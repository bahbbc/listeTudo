class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks , :dependent => :destroy

	validates :name, :user, presence: true

	scope :public_list, -> { where(private: false) }
end
