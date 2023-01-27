require 'rails_helper'

RSpec.describe 'Country Show Page' do
  before do
    VCR.use_cassette 'new user' do
      visit '/'
      click_button 'Create a New User'
      fill_in :name, with: 'test'
      fill_in :email, with: 'test@test.com'
      fill_in :password, with: 'test123'
      fill_in :password_confirmation, with: 'test123'
      click_button 'Create New User'
    end
    VCR.use_cassette 'Japan Learning Resource' do
      visit '/country/Japan'
    end
  end
  describe 'when I am taken to the country show page' do
    it 'displays the country\'s name' do
      expect(page).to have_content('Japan')
    end

    xit 'displays a video window with a video from YouTube about the country' do
    end

    xit 'shows a gallery of images about the country' do
    end
  end
end