require 'rails_helper'

feature 'Photos' do

  scenario 'no photos have been added' do
    visit '/photos'
    expect(page).to have_content 'Add a photo'
  end

  scenario 'user can post a photo' do
    visit '/photos'
    upload_photo
    expect(page).to have_content "Test title"
    expect(Photo.count).to eq(1)
    #add proper test for image
  end

  scenario 'users can comment on a photo' do
    visit '/photos'
    upload_photo
    click_link 'Comment'
    fill_in 'Comment', with: "Nice pic!"
    click_button 'Comment'
    expect(page).to have_content("Nice pic")
  end

  def upload_photo(title="test title", caption="test caption")
    click_link 'Add a photo'
    within('#upload_photo') do
      fill_in 'Title', with: "Test title"
      fill_in 'Caption', with: "Test caption"
      click_button 'Upload'
    end
  end

end