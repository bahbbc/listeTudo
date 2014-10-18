require 'rails_helper'

RSpec.describe List, :type => :model do

	before :each do
		@public_list1 = create(:list, private: false)
		@public_list2 = create(:list, private: false)
		@private_list1 = create(:list)
		private_list2 = create(:list)
	end

	describe '#public_list' do
		it 'returns public lists' do
			expect(List.public_list).to contain_exactly(@public_list1, @public_list2)
		end
	end

	describe '#is_public_list' do
		context 'when list is public' do
			it 'returns true' do
				expect(@public_list1.is_public_list).to be true
			end
		end

		context 'when list is private' do
			it 'returns false' do
				expect(@private_list1.is_public_list).to be false
			end
		end
	end

end
