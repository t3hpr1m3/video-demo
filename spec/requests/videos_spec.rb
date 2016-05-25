require 'rails_helper'

describe 'Videos' do
  describe 'listing videos' do
    before do
      create(:video, title: 'Test 1', category: 'Test1', location: 'WA')
    end

    it 'retrieves the list of videos' do
      expect(Video).to receive(:all)
      get '/videos'
    end
  end
end
