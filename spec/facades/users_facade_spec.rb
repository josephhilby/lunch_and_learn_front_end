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

    describe '.post_user_results' do
      context 'with valid params' do
        it 'returns a JSON object of user information', :vcr do
          @good_create_params[:email] = 'new_new_email@to_not_conflict.com'
          results = UsersFacade.new(@good_create_params).post_user_results

          expect(results).to be_a(Hash)
          expect(results.count).to eq(1)
          expect(results).to have_key(:data)

          result = results[:data]
          expect(result).to be_a(Hash)
          expect(result.count).to eq(3)

          expect(result).to have_key(:id)
          expect(result[:id]).to be_a(String)

          expect(result).to have_key(:type)
          expect(result[:type]).to be_a(String)
          expect(result[:type]).to eq('user')

          expect(result).to have_key(:attributes)
          expect(result[:attributes]).to be_a(Hash)
          expect(result[:attributes].count).to eq(3)

          expect(result[:attributes]).to have_key(:name)
          expect(result[:attributes][:name]).to be_a(String)
          expect(result[:attributes][:name]).to eq("Athena Dao")

          expect(result[:attributes]).to have_key(:email)
          expect(result[:attributes][:email]).to be_a(String)
          expect(result[:attributes][:email]).to eq('new_new_email@to_not_conflict.com')

          expect(result[:attributes]).to have_key(:api_key)
          expect(result[:attributes][:api_key]).to be_a(String)
        end
      end

      context 'with non-valid params' do
        it 'returns an error', :vcr do
          expect(UsersFacade.new(@bad_params).post_user_results).to eq({message: "Name can't be blank and Email can't be blank"})
        end
      end
    end

    describe '.service' do
      it 'returns a LunchAndLearnService object' do
        expect(UsersFacade.new.service).to be_a(LunchAndLearnService)
      end
    end
	end
end
