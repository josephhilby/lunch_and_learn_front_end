class User
	attr_reader :id, :type, :name, :email, :api_key
	def initialize(data)
		@id = data[:id]
		@type = data[:type]
		@name = data[:attributes][:name]
		@email = data[:attributes][:email]
		@api_key = data[:attributes][:api_key]
	end
end