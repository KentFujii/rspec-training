require 'rails_helper'

feature 'About BigCo modal' do
  scenario 'toggles display of the modal about display', js: true do
    visit root_path

    expect(page).not_to have_content 'About BigCo'
    expect(page).not_to have_content 'BigCo produces the finest widgets in all the land'

    click_link 'About Us'

    expect(page).not_to have_content 'About BigCo'
    expect(page).not_to have_content 'BigCo produces the finest widgets in all the land'

    within '#about_us' do
      # click_button 'Close'
      # ボタンが現れるまでCapybaraをタイムアウトする
      find_button('Close').click
    end

    expect(page).not_to have_content 'About BigCo'
    expect(page).not_to have_content 'BigCo produces the finest widgets in all the land'
  end
end
