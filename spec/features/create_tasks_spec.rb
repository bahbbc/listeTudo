require "rails_helper"

feature "Create Tasks" do

	before :each do
		@user = create(:user)
		visit new_user_session_path
    fill_in "E-mail", :with => @user.email
    fill_in "Senha", :with => @user.password
    click_button "Log in"
	end

  scenario "User creates a list" do
    visit "lists"
    fill_in "list_name", :with => "Tarefas do dia"
    click_button "+"
    expect(page).to have_content("Tarefas do dia")
  end

  scenario "User creates a task" do
  	list = create(:list, user: @user)
  	visit list_tasks_path(list)
  	fill_in "task_title", :with => "Dormir"
  	click_button "+"
  	expect(page).to have_content("Dormir")
  end
end