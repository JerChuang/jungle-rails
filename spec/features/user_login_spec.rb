require 'rails_helper'

RSpec.feature "Users can log in and gets redirect to home page", type: :feature, js: true do

  # SETUP
 before :each do
    @user = User.create first_name: 'Alice', last_name: 'Wilson', email: 'alice.wilson@test.com', password: '12345678', password_confirmation: '12345678'
 end

 scenario "They fill in info and login " do
   # ACT
   visit "/login"

   # DEBUG / VERIFY
  
   fill_in 'email', with: 'alice.wilson@test.com'
   fill_in 'password', with: '12345678'
   click_button 'Submit'

   within('main') {expect(page).to have_css('.products-index')}

   save_screenshot
 end

end