require 'rails_helper'
require './app/services/lunch_and_learn_service'

RSpec.describe LunchAndLearnService do
	describe 'class_methods' do
		describe '.post_user' do
			it 'returns a JSON object from API', :vcr do
        form_data = {
                      name: "Athena Dao",
                      email: "athenadao@best.com",
                      password: "supersecretpassword",
                      password_confirmation: "supersecretpassword"
                    }

				return_body = LunchAndLearnService.new.post_user(form_data)
				expect(return_body).to be_a(Hash)
        expect(return_body.size).to eq(1)
        data = return_body[:data]

        expect(data.size).to eq(3)
        expect(data).to have_key(:id)
        expect(data[:id]).to be_an(String)

        expect(data).to have_key(:type)
        expect(data[:type]).to be_an(String)
        expect(data[:type]).to eq('user')

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_an(Hash)
        expect(data[:attributes].size).to eq(3)

        expect(data[:attributes]).to have_key(:name)
        expect(data[:attributes][:name]).to be_a(String)
        expect(data[:attributes][:name]).to eq("Athena Dao")

        expect(data[:attributes]).to have_key(:email)
        expect(data[:attributes][:email]).to be_a(String)
        expect(data[:attributes][:email]).to eq("athenadao@best.com")

        expect(data[:attributes]).to have_key(:api_key)
        expect(data[:attributes][:api_key]).to be_a(String)
			end
		end

    describe '.post_session' do
			it 'returns a JSON object from API', :vcr do
        form_data = {
                      email: "athenadao@best.com",
                      password: "supersecretpassword"
                    }
				return_body = LunchAndLearnService.new.post_session(form_data)
				expect(return_body).to be_a(Hash)
        expect(return_body.size).to eq(1)
        data = return_body[:data]

        expect(data.size).to eq(3)
        expect(data).to have_key(:id)
        expect(data[:id]).to be_an(String)

        expect(data).to have_key(:type)
        expect(data[:type]).to be_an(String)
        expect(data[:type]).to eq('user')

        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_an(Hash)
        expect(data[:attributes].size).to eq(3)

        expect(data[:attributes]).to have_key(:name)
        expect(data[:attributes][:name]).to be_a(String)
        expect(data[:attributes][:name]).to eq("Athena Dao")

        expect(data[:attributes]).to have_key(:email)
        expect(data[:attributes][:email]).to be_a(String)
        expect(data[:attributes][:email]).to eq("athenadao@best.com")

        expect(data[:attributes]).to have_key(:api_key)
        expect(data[:attributes][:api_key]).to be_a(String)
			end
		end

    describe '.get_recipes' do
			it 'returns a JSON object from API', :vcr do
        country = "thai"
				return_body = LunchAndLearnService.new.get_recipes(country)
				expect(return_body[:data].count).to eq(20)
        expect(return_body.size).to eq(1)

        return_body[:data].each do |recipe|
          expect(recipe.size).to eq(3)
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to be_an(NilClass)

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to be_an(String)
          expect(recipe[:type]).to eq('recipe')

          expect(recipe).to have_key(:attributes)
          expect(recipe[:attributes]).to be_an(Hash)

          expect(recipe[:attributes].size).to eq(4)
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:url]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes][:country]).to be_a(String)
          expect(recipe[:attributes][:country]).to eq("Thailand")

          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a(String)
        end
			end
		end

    describe '.get_random_recipes' do
			it 'returns a JSON object from API', :vcr do
				return_body = LunchAndLearnService.new.get_random_recipes
        expect(return_body.size).to eq(1)

        return_body[:data].each do |recipe|
          expect(recipe.size).to eq(3)
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to be_an(NilClass)

          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to be_an(String)
          expect(recipe[:type]).to eq('recipe')

          expect(recipe).to have_key(:attributes)
          expect(recipe[:attributes]).to be_an(Hash)

          expect(recipe[:attributes].size).to eq(4)
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes][:url]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes][:country]).to be_a(String)

          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a(String)
        end
			end
		end

		describe '.get_url', :vcr do
			it 'returns JSON hash from response body' do
				url = LunchAndLearnService.new.get_url("/api/v1/recipes")
				expect(url).to be_a(Hash)
			end
		end

		describe '.post_url', :vcr do
			it 'returns JSON hash from response body' do
        form_data = {
                      email: "athenadao@best.com",
                      password: "supersecretpassword"
                    }
				url = LunchAndLearnService.new.post_url("/api/v1/sessions", form_data.to_json)
				expect(url).to be_a(Hash)
			end
		end

		describe '.conn', :vcr do
			it 'connects with http://localhost:5001' do
				conn = LunchAndLearnService.new.conn
				expect(conn.params).to be_a(Hash)
			end
		end
	end
end