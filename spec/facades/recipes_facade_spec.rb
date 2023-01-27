require 'rails_helper'

RSpec.describe RecipesFacade do
  describe 'initialize' do
    it 'exists' do
      recipe_facade = RecipesFacade.new
      expect(recipe_facade).to be_a(RecipesFacade)
    end
  end

	describe 'class_methods' do
		describe '.find_recipes_by_country' do
      context 'with valid params' do
        it 'returns an Array of Recipe objects', :vcr do
          expect(RecipesFacade.new({country: 'Thailand'}).find_recipes_by_country).to be_a(Array)
          expect(RecipesFacade.new({country: 'Thailand'}).find_recipes_by_country.first).to be_a(Recipe)
        end
      end

      context 'with non-valid params' do
        it 'returns nil', :vcr do
          expect(RecipesFacade.new({country: 'xkcd'}).find_recipes_by_country).to eq(nil)
          expect(RecipesFacade.new({country: ''}).find_recipes_by_country).to eq(nil)
        end
      end
		end

    describe '.get_message' do
      context 'with valid params' do
        it 'returns an nil', :vcr do
          expect(RecipesFacade.new({country: 'Thailand'}).get_message).to eq(nil)
        end
      end

      context 'witn non-valid params' do
        it 'returns an empity Array', :vcr do
          expect(RecipesFacade.new({country: 'xkcd'}).get_message).to eq('Not Found')
          expect(RecipesFacade.new({country: ''}).get_message).to eq('Not Found')
        end
      end
		end

		describe '.get_recipes_results' do
      context 'with valid params' do
        it 'returns an Array of recipes from that country', :vcr do
          results = RecipesFacade.new({country: 'Thailand'}).get_recipes_results

          expect(results).to be_a(Hash)
          expect(results.count).to eq(1)
          expect(results).to have_key(:data)
          expect(results[:data]).to be_a(Array)

          first_result = results[:data].first
          expect(first_result).to be_a(Hash)
          expect(first_result.count).to eq(3)

          expect(first_result).to have_key(:id)
          expect(first_result[:id]).to eq(nil)

          expect(first_result).to have_key(:type)
          expect(first_result[:type]).to be_a(String)
          expect(first_result[:type]).to eq('recipe')

          expect(first_result).to have_key(:attributes)
          expect(first_result[:attributes]).to be_a(Hash)
          expect(first_result[:attributes].count).to eq(4)

          expect(first_result[:attributes]).to have_key(:title)
          expect(first_result[:attributes][:title]).to be_a(String)

          expect(first_result[:attributes]).to have_key(:url)
          expect(first_result[:attributes][:url]).to be_a(String)

          expect(first_result[:attributes]).to have_key(:country)
          expect(first_result[:attributes][:country]).to be_a(String)
          expect(first_result[:attributes][:country]).to eq('Thailand')

          expect(first_result[:attributes]).to have_key(:image)
          expect(first_result[:attributes][:image]).to be_a(String)
        end
      end

      context 'with non-valid params' do
        it 'returns an error message', :vcr do
          expect(RecipesFacade.new({country: 'xkcd'}).get_recipes_results).to eq({message: "Not Found"})
          expect(RecipesFacade.new({country: ''}).get_recipes_results).to eq({message: "Not Found"})
        end
      end
		end

    describe '.service' do
      it 'returns a LunchAndLearnService object' do
        expect(RecipesFacade.new.service).to be_a(LunchAndLearnService)
      end
    end
	end
end