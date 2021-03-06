require 'rails_helper'

RSpec.describe List, :type => :model do

	before :each do
		@jose = create(:user, email: 'jose@bananas.com.br')
		@public_list1 = create(:list, private: false, user: @jose)
		@public_list2 = create(:list, private: false, user: @jose)
		@private_list1 = create(:list, user: @jose)
		private_list2 = create(:list, user: @jose)
	end

	describe '#public_list' do
		it 'returns public lists' do
			expect(List.public_list).to contain_exactly(@public_list1, @public_list2)
		end
	end

	describe '#already_favorite' do
		context 'when list is favorite' do
			it 'returns true' do
				favorite_list = create(:favorite_list, list: @private_list1, user: @jose)
				expect(@private_list1.already_favorite(@jose)).to be_truthy
			end
		end

		context 'when list is not favorite' do
			it 'returns false' do
				expect(@public_list1.already_favorite(@jose)).to be_falsey
			end
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
