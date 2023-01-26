require 'rails_helper'

RSpec.describe 'The Recipes Page', type: :feature do
  before do
    visit login_path
    fill_in :email, with: 'test@test'
    fill_in :password, with: 'test'
    click_button 'Log In'
  end

  describe 'When I visit the recipes show page' do
    it 'I see a flash message "Welcome, test@test"', :vcr do
      save_and_open_page
      expect(page).to have_content("Welcome, test@test")
    end

    it 'I see the title "Find Recipes By Country"', :vcr do
      save_and_open_page
      expect(page).to have_content("Find Recipes By Country")
    end

    it 'I see a form to search a country by name', :vcr do
      within "#find_recipes_by_country_form" do
        expect(page).to have_content("Country")
        expect(page).to have_button("Find Recipes")
      end
    end

    it 'I see a button to choose a random country', :vcr do
      within "#random_country_button" do
        expect(page).to have_button("Choose a Country for me!")
      end
    end

    xit 'I see a button to take me to that users favorites index page', :vcr do

    end

    context 'when there is no country selected' do
      it 'I dont see a button to take me to that countries show page', :vcr do
        expect(page).to_not have_content("Learn about")
      end

      xit 'I dont see any recipe cards', :vcr do

      end
    end

    context 'when a country is selected' do
      it 'I see a button to take me that that countries show page', :vcr do
        within "#find_recipes_by_country_form" do
          fill_in :country, with: 'thai'
          click_button 'Find Recipes'
        end
        expect(page).to have_button("Learn about Thailand")
      end

      xit 'I see recipe cards with recipes from Thailand', :vcr do

      end
    end
  end
end