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
      context 'with valid params' do
        it 'returns a Learning Resource object', :vcr do
          expect(LearningResourcesFacade.new({name: 'Japan'}).find_resources_by_country).to be_a LearningResource
        end
      end

      context 'with non-valid params' do
        it 'returns nil', :vcr do
          expect(LearningResourcesFacade.new({country: 'xkcd'}).find_resources_by_country).to be nil
          expect(LearningResourcesFacade.new({country: ''}).find_resources_by_country).to be nil
        end
      end
      
    end

    describe '#get_message' do
      context 'with valid params' do
        it 'returns a nil', :vcr do
          expect(LearningResourcesFacade.new({name: 'Japan'}).get_message).to be nil
        end
      end

      context 'with non-valid params' do
        it 'returns an empity Array', :vcr do
          expect(LearningResourcesFacade.new({country: 'xkcd'}).get_message).to eq('Not Found')
          expect(LearningResourcesFacade.new({country: ''}).get_message).to eq('Not Found')
        end
      end
    end

    describe '#get_resources_results' do
      context 'with valid params' do
        it 'returns a learning resource from that country', :vcr do
          results = LearningResourcesFacade.new({name: 'Thailand'}).get_resources_results
          
          expect(results).to be_a(Hash)
          expect(results).to have_key :data

          data = results[:data]
          expect(data).to have_key :id
          expect(data[:id]).to be nil
          expect(data).to have_key :type
          expect(data).to have_key :attributes

          attrs = data[:attributes]
          expect(attrs).to have_key :country
          expect(attrs).to have_key :video
          expect(attrs[:video]).to have_key :title
          expect(attrs[:video]).to have_key :youtube_video_id
          expect(attrs).to have_key :images
          expect(attrs[:images]).to be_an Array
        end
      end

      context 'with non-valid params' do
        it 'returns an error message', :vcr do
          expect(LearningResourcesFacade.new({country: 'xkcd'}).get_resources_results).to eq({message: "Not Found"})
          expect(LearningResourcesFacade.new({country: ''}).get_resources_results).to eq({message: "Not Found"})
        end
      end
    end

    describe '#service' do
      it 'returns a LunchAndLearnService object' do
        expect(LearningResourcesFacade.new.service).to be_a(LunchAndLearnService)
      end
    end
  end
end