require 'rails_helper'

RSpec.describe 'The Register Page', type: :feature do
  before do
    visit register_path
  end

  describe 'When I visit the users new page' do
    it 'I see the title "Register a New User"' do
      expect(page).to have_content('Register a New User')
    end

    context 'given valid params', :vcr do
      it 'start a session and route to recipes index page' do
        fill_in :name, with: 'test'
        fill_in :email, with: 'test@test.com'
        fill_in :password, with: 'test'
        fill_in :password_confirmation, with: 'test'
        click_button 'Create New User'

        # need to figure out a way to access VCR.cassettes data[:id] to not have to hard code the id into the expect line.
        expect(current_path).to eq("/recipes/2")
      end
    end

    context 'given non-valid params', :vcr do
      it 'returns an error message' do
        fill_in :name, with: 'test'
        fill_in :password, with: 'test'
        fill_in :password_confirmation, with: 'test'
        click_button 'Create New User'

        expect(current_path).to eq(register_path)
        expect(page).to have_content("Email can't be blank")
      end
    end
  end
end