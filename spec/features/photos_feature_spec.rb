require 'rails_helper'

feature 'Photos' do

  scenario 'no photos have been added' do
    visit '/photos'
    expect(page).to have_content 'Add a photo'
  end
end