class LearningResourcesFacade
  def initialize(params = nil)
    @params = params
  end

  def find_resources_by_country
    if get_resources_results[:message]
      return nil
    else
      LearningResource.new(get_resources_results[:data])
    end
  end

  def get_message
    get_resources_results[:message]
  end

  def get_resources_results
    if @params[:country] == 'random'
      @results ||= service.get_random_learning_resources
    else
      @_results ||= service.get_learning_resources(@params[:name])
    end
  end

  def service
     @_service ||= LunchAndLearnService.new
  end
end