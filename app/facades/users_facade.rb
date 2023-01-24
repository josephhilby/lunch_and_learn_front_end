require './app/poros/user'

class UsersFacade
  def initialize(params = nil)
    @params = params
  end

  def create_user
    if post_user_results[:message]
      return nil
    else
      User.new(post_user_results[:data])
    end
  end

  def find_user
    if post_session_results[:message]
      return nil
    else
      User.new(post_session_results[:data])
    end
  end

  def post_message
    post_user_results[:message]
  end

  def session_message
    post_session_results[:message]
  end

  def post_user_results
    @_results ||= service.post_user(@params)
  end

  def post_session_results
    @_results ||= service.post_session(@params)
  end

  def service
    @_service ||= LunchAndLearnService.new
  end
end