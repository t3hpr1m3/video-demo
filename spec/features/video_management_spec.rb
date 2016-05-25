require 'rails_helper'

describe 'Video Management' do

  feature 'User uploads a video' do
    scenario 'they see the video on the page' do
      visit '/videos/new'
      fill_in 'Title', with: 'New York Trip'
      fill_in 'Category', with: 'travel'
      select('New York', from: 'Location')

      click_button 'Save'
      expect(page).to have_text('Video successfully uploaded.')
    end
  end
end
