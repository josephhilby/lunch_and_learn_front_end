class LearningResource
  attr_reader :country, :video, :images
  def initialize(data)
    @country = data[:attributes][:country]
    @video = data[:attributes][:video]
    @images = data[:attributes][:images]
  end
end