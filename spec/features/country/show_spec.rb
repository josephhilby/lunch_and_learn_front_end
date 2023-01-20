require 'rails_helper'

RSpec.describe 'Country Show Page' do
  describe 'when I am taken to the country show page' do
    before do
      visit '/country/Japan'
    end

    it 'displays the country\'s name' do
      expect(page).to have_content('Japan')
    end

    xit 'displays a video window with a video from YouTube about the country' do

    end

    xit 'shows a gallery of images about the country' do
    end
  end
end