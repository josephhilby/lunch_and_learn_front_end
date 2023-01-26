require 'rails_helper'

RSpec.describe Recipe do
	before do
		attrs = { type: 'type',
              attributes: {
                  title: 'title',
                  url: 'url',
                  country: 'country',
                  image: 'image'
              } }
		@recipe = Recipe.new(attrs)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@recipe).to be_a(Recipe)
		end

		it 'has readible attributes' do
			expect(@recipe.type).to eq('type')
			expect(@recipe.title).to eq('title')
			expect(@recipe.url).to eq('url')
			expect(@recipe.country).to eq('country')
			expect(@recipe.image).to eq('image')
		end
	end
end