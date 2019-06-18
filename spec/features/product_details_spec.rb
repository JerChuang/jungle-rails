require 'rails_helper'

RSpec.feature "Visitor can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do

  # SETUP
  before :each do
   @category = Category.create! name: 'Apparel'

   10.times do |n|
     @category.products.create!(
       name:  Faker::Hipster.sentence(3),
       description: Faker::Hipster.paragraph(4),
       image: open_asset('apparel1.jpg'),
       quantity: 10,
       price: 64.99
     )
   end
 end

 scenario "They click on a product link on home page" do
   # ACT
   visit root_path

   # DEBUG / VERIFY
   
 
   productElem = click_link @category.products.find(1).name
   visit productElem['href']
   expect(page).to have_css '.products-show', count: 1

   save_screenshot
 end

end