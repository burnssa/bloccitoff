require 'rails_helper'

feature 'User creates a to-do list' do
	before(:all) do
		@user = create(:user)
		visit root_path
	end

	scenario 'root has correct content' do
		expect(page).to have_content('A self-destructing to-do list')
		expect(page).to have_link('Sign Up')
		expect(page).to have_link('Sign In')
	end

	context 'User successfully logs in with username and password' do

		before(:all) do
			click_link 'Sign In'
			email = @user.email

			fill_in 'username', with: 'Douglas Adams'
			fill_in 'email', with: email
			fill_in 'password', with: 'helloworld'
			fill_in 'password_confirmation', with: 'helloworld'
		end

		scenario 'sign-in' do
			expect(page).to have_content('My list')
			expect(page).to have_button('Create new to-do')

			click_button "Create new to-do"

			expect(page).to have_content('Add to-do name')
		end

		scenario 'create to-do' do
		
			fill_in 'to-do task', with: 'Clean kitchen'

			expect(page).to have_content('Clean kitchen')
			expect(page).to have_content('6')
		end


		pending





		scenario 'creates a to-do list' do
		end

		scenario 'adds a task to to-do list' do
		end

		scenario 'successfully completes and removes a task' do
		end

		scenario 'leaves a task for 5 days and sees a notice' do
		end

		scenario 'after 7 days no longer can see a created task' do
		end

	end





	scenario 'User unsuccessfully logs in with incorrect password' do
	end


	
end
