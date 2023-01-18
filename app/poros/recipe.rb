class Recipe
	attr_reader :type, :title, :url, :country, :image
	def initialize(data)
		@type = data[:type]
		@title = data[:attributes][:title]
		@url = data[:attributes][:url]
		@country = data[:attributes][:country]
		@image = data[:attributes][:image]
	end
end