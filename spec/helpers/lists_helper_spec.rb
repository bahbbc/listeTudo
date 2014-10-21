require 'rails_helper'

RSpec.describe ListsHelper do

	describe '#list_privacy' do
		it 'returns a list privacy' do
			list = create(:list, private: false)
			expect(helper.list_privacy(list)).to eq 'Pública'
		end
	end

	describe '#belongs_to_user' do
		it 'returns a true when is the current_user list' do
			list = create(:list, private: false)
			helper.stub(:current_user).and_return(list.user)
			expect(helper.belongs_to_user(list)).to be true
		end
	end
	
end