require 'rails_helper'

RSpec.describe 'The Recipes Page', type: :feature do
  before do
    visit login_path
    fill_in :email, with: 'test@test'
    fill_in :password, with: 'test'
    click_button 'Log In'
  end

  describe 'When I visit the recipes show page' do
    it 'I see the title "Find Recipes By Country"' do
    end

    context 'when there is no country selected', :vcr do
      it 'start a session and route to recipes index page' do
      end
    end

    context 'when a country is selected', :vcr do
      it 'returns an error message' do
      end
    end
  end
end