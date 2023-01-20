require 'rails_helper'

RSpec.describe UsersFacade do
  describe 'initialize' do
    it 'exists' do
      users_facade = UsersFacade.new
      expect(users_facade).to be_a(UsersFacade)
    end
  end

	describe 'class_methods' do
    before do
      @good_create_params = {
          name: "Athena Dao",
          email: "athenadao@bestgirlever.com",
          password: "supersecretpassword",
          password_confirmation: "supersecretpassword"
          }
      @good_find_params = {
          email: "athenadao@bestgirlever.com",
          password: "supersecretpassword"
          }
      @bad_params = {
          password: "supersecretpassword"
          }
    end

		describe '.create_user' do
      context 'with valid params' do
        it 'returns a User object', :vcr do
          expect(UsersFacade.new(@good_create_params).create_user).to be_a(User)
        end
      end

      context 'witn non-valid params' do
        it 'returns nil', :vcr do
          expect(UsersFacade.new(@bad_params).create_user).to eq(nil)
        end
      end
		end

    describe '.find_user' do
      context 'with valid params' do
        it 'returns a User object', :vcr do
          expect(UsersFacade.new(@good_find_params).find_user).to be_a(User)
        end
      end

      context 'witn non-valid params' do
        it 'returns nil', :vcr do
          expect(UsersFacade.new(@bad_params).find_user).to eq(nil)
        end
      end
		end

		describe '.get_recipes_results' do
      context 'with valid params' do
        it 'returns an Array of recipes from that country', :vcr do
          results = UsersFacade.new({country: 'Thailand'}).get_recipes_results

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

      context 'with non-vlid params' do
        it 'returns an error message', :vcr do
          expect(UsersFacade.new({country: 'xkcd'}).get_recipes_results).to eq({message: "Not Found"})
          expect(UsersFacade.new({country: ''}).get_recipes_results).to eq({message: "Not Found"})
        end
      end
		end
	end
end