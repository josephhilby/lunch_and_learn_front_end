class LearningResourcesFacade
  def initialize(params = nil)
    @params = params
  end

  def find_learning_resources_by_country
    get_learning_resources_results[:data].map do |data|
      LearningResource.new(data)
    end
  end

  def get_learning_resources_results
    @_results ||= service.get_learning_resources(@params[:country])
  end

  def service
     @_service ||= LunchAndLearnService.new
     binding.pry
  end
end