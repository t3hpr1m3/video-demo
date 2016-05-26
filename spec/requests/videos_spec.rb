require 'rails_helper'

describe 'Videos' do
  describe 'listing videos' do
    before do
      create(:video, title: 'Test 1', category: 'Test1', location: 'WA')
    end

    it 'retrieves the list of videos' do
      expect(Video).to receive(:all).and_call_original
      get '/videos'
    end

    it 'responds with :success' do
      get '/videos'
      expect(response.status).to eql(200)
    end

    it 'renders a list of videos' do
      get '/videos'
      expect(response.body).to include('Test 1')
    end
  end

  describe 'viewing a video' do
    let!(:video) { create(:video) }

    it 'retrieves the video from the database' do
      expect(Video).to receive(:find).with(video.id.to_s).and_call_original
      get "/videos/#{video.id}"
    end

    context 'when the video exists' do
      before do
        allow(Video).to receive(:find).with(video.id.to_s).and_return(video)
      end

      it 'responds with :success' do
        get "/videos/#{video.id}"
        expect(response.status).to eql(200)
      end
    end
  end
end
