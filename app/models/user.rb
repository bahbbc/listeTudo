class User < ActiveRecord::Base
	has_many :tasks , :through => :lists
	has_many :lists , :dependent => :destroy
	has_many :favorite_lists, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
