require 'rails_helper'

RSpec.describe TasksHelper do
	
	describe '#status_list' do
		context 'when it isnt done' do
			it 'includes the task name' do
				task = build(:task, status: false)
				expect(helper.status_list(task)). to eq task.title
			end
		end

		context 'when it is done' do
			it 'includes the task name with strike-through' do
				task = build(:task, status: true)
				expect(helper.status_list(task)). to eq "<del>#{task.title}</del>"
			end
		end
	end
end