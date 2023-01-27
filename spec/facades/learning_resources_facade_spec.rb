require 'rails_helper'

RSpec.describe LearningResourcesFacade do
  describe 'initialize' do
    it 'exists' do
      lr_facade = LearningResourcesFacade.new
      expect(lr_facade). to be_a(LearningResourcesFacade)
    end
  end

  describe 'instance_methods' do
    describe '#find_resources_by_country' do
      it 'returns a Learning Resource object' do
        expect(LearningResourcesFacade.new({country: 'Japan'}).find_resources_by_country).to be_a LearningResource
      end
    end
  end
end