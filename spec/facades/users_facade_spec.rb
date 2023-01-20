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

		describe '.post_message' do
      context 'with valid params' do
        it 'returns nil', :vcr do
          @good_create_params[:email] = 'new_email@to_not_conflict.com'
          expect(UsersFacade.new(@good_create_params).post_message).to eq(nil)
        end
      end

      context 'with non-vlid params' do
        it 'returns an error message', :vcr do
          expect(UsersFacade.new(@bad_params).post_message).to eq("Name can't be blank and Email can't be blank")
        end
      end
		end

    describe '.session_message' do
      context 'with valid params' do
        it 'returns nil', :vcr do
          expect(UsersFacade.new(@good_create_params).session_message).to eq(nil)
        end
      end

      context 'with non-vlid params' do
        it 'returns an error message', :vcr do
          expect(UsersFacade.new(@bad_params).session_message).to eq("Unknown username or password")
        end
      end
    end
	end
end
          # expect(results).to be_a(Hash)
          # expect(results.count).to eq(1)
          # expect(results).to have_key(:data)
          # expect(results[:data]).to be_a(Array)

          # first_result = results[:data].first
          # expect(first_result).to be_a(Hash)
          # expect(first_result.count).to eq(3)

          # expect(first_result).to have_key(:id)
          # expect(first_result[:id]).to eq(nil)

          # expect(first_result).to have_key(:type)
          # expect(first_result[:type]).to be_a(String)
          # expect(first_result[:type]).to eq('recipe')

          # expect(first_result).to have_key(:attributes)
          # expect(first_result[:attributes]).to be_a(Hash)
          # expect(first_result[:attributes].count).to eq(4)

          # expect(first_result[:attributes]).to have_key(:title)
          # expect(first_result[:attributes][:title]).to be_a(String)

          # expect(first_result[:attributes]).to have_key(:url)
          # expect(first_result[:attributes][:url]).to be_a(String)

          # expect(first_result[:attributes]).to have_key(:country)
          # expect(first_result[:attributes][:country]).to be_a(String)
          # expect(first_result[:attributes][:country]).to eq('Thailand')

          # expect(first_result[:attributes]).to have_key(:image)
          # expect(first_result[:attributes][:image]).to be_a(String)