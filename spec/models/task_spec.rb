require 'rails_helper'

RSpec.describe Task, :type => :model do

	describe '#undone_order' do
		it 'returns tasks order by the uncomplete tasks' do
			list = create(:list)
			task1 = create(:task, list: list)
			task2 = create(:task, list: list)
			task3 = create(:task, list: list, status: true)
			expect(Task.undone_order).to eq [task1, task2, task3]
		end
	end

end
