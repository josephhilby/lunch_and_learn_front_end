require 'rails_helper'

RSpec.describe 'The Log In Page', type: :feature do
  before do
    visit login_path
  end

  describe 'When I visit the sessions new page' do
    it 'I see the title "User Log In"' do
      expect(page).to have_content('User Log In')
    end

    context 'given valid params', :vcr do
      it 'start a session and route to recipes index page' do
        fill_in :email, with: 'test@test.com'
        fill_in :password, with: 'test'
        click_button 'Log In'

        # need to figure out a way to access VCR.cassettes data[:id] to not have to hard code the id into the expect line.
        expect(current_path).to eq("/recipes/2")
      end
    end

    context 'given non-valid params', :vcr do
      it 'returns an error message' do
        fill_in :password, with: 'test'
        click_button 'Log In'

        expect(current_path).to eq(sessions_path)
        expect(page).to have_content("Unknown username or password")
      end
    end
  end
end