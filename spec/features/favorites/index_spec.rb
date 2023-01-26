require 'rails_helper'

RSpec.describe 'The Favorites Page', type: :feature do
  before do
    visit login_path
    fill_in :email, with: 'test@test'
    fill_in :password, with: 'test'
    click_button 'Log In'
    click_button 'Show me my favorites'
  end

  describe 'When I visit the favorites index page' do
    it 'I see a header "Favorites"', :vcr do
      expect(page).to have_content("Favorites")
    end

    context 'when the user has no favorites' do
    end

    context 'when the user has favorites' do
    end
  end
end