require 'rails_helper'

RSpec.describe User do
	before do
		attrs = { id: 'id',
              type: 'type',
              attributes: {
                  name: 'name',
                  email: 'email',
                  api_key: 'api_key'
              } }
		@user = User.new(attrs)
	end

	describe 'initialize' do
		it 'exists' do
			expect(@user).to be_a(User)
		end

		it 'has readible attributes' do
			expect(@user.id).to eq('id')
			expect(@user.type).to eq('type')
			expect(@user.name).to eq('name')
			expect(@user.email).to eq('email')
			expect(@user.api_key).to eq('api_key')
		end
	end
end