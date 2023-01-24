require './app/poros/recipe'

class RecipesFacade
  def initialize(params = nil)
    @params = params
  end

  def find_recipes_by_country
    if get_recipes_results[:message]
      return nil
    else
      get_recipes_results[:data].map do |data|
        Recipe.new(data)
      end
    end
  end

  def get_message
    get_recipes_results[:message]
  end

  def get_recipes_results
    if @params[:country] == 'random'
      @_results ||= service.get_random_recipes
    else
      @_results ||= service.get_recipes(@params[:country])
    end
  end

  def service
    @_service ||= LunchAndLearnService.new
  end
end