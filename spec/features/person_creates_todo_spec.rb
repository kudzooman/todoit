require 'rails_helper'

feature 'Person creates TODO' do 
  scenario 'Successfully' do
    visit new_list_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
  end
end