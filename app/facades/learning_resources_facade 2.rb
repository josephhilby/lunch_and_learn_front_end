class LearningResourcesFacade
  def initialize(params = nil)
    @params = params
  end

  def find_resources_by_country
    get_resources_results[:data].map do |data|
      LearningResource.new(data)
    end
  end

  def get_resources_results
    @_results ||= service.get_learning_resources(@params[:country])
  end

  def service
     @_service ||= LunchAndLearnService.new
  end
end