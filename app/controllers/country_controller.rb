class CountryController < ApplicationController
  def show
    @resources = LearningResourcesFacade.new(params).find_resources_by_country
  end
end