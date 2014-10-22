require "rails_helper"

feature "Create Favorite List" do

	before :each do
		@user = create(:user)
		visit new_user_session_path
    fill_in "E-mail", :with => @user.email
    fill_in "Senha", :with => @user.password
    click_button "Log in"
	end

	scenario "User favorites a public list" do
		maria = create(:user, email: 'maria@bol.com.br' )
		list = create(:list, private: false ,user: maria)
		visit list_tasks_path(list)
		click_link "Gostei dessa!"
		expect(page).to have_content("Lista adicionada as favoritas com sucesso!")
	end

	scenario "User tries to favorite a private list" do
		maria = create(:user, email: 'maria@bol.com.br' )
		list = create(:list, private: true, user: maria)
		visit list_tasks_path(list)
		expect(page.status_code).to eq 401
	end
end