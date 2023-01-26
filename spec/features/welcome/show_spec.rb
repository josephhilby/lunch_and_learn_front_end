require 'rails_helper'

RSpec.describe 'The Welcome Page', type: :feature do
  let!(:user_1) {  }

  before do
    visit '/'
  end

  describe 'When I visit the welcome show page' do
    context 'when I am not logged in' do
      it 'I see the title of the application' do
        expect(page).to have_content('Lunch and Learn')
      end

      it 'I see a link to go back to the welcome page' do
        click_link 'Home'

        expect(page).to have_current_path('/')
      end

      it 'I see a link to go back to the users new page' do
        click_link 'Register'

        expect(page).to have_current_path(register_path)
      end

      it 'I see a link to go back to the sessions new page' do
        click_link 'Log In'

        expect(page).to have_current_path(login_path)
      end

      it 'I dont see a link to logout' do
        expect(page).to_not have_content('Log Out')
      end
    end

    context 'when I am logged in' do
      before(:each) do
        visit login_path
        fill_in :email, with: 'test@test'
        fill_in :password, with: 'test'
        click_button 'Log In'

        visit '/'
      end

      xit 'I see the title of the application' do
        expect(page).to have_content('Lunch and Learn')
      end

      xit 'I see a link to go back to the welcome page' do
        click_link 'Home'

        expect(page).to have_current_path('/')
      end

      xit 'I see a link to logout' do
        click_link 'Log Out'

        expect(page).to have_current_path(logout_path)
      end

      xit 'I dont see a link to go back to the users new page' do
        expect(page).to_not have_content('Register')
      end

      xit 'I dont see a link to go back to the sessions new page' do
        expect(page).to_not have_content('Log In')
      end
    end
  end
end
