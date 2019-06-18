require 'rails_helper'

RSpec.feature "Users can click the 'Add to Cart' button to increate cart by 1", type: :feature, js: true do

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

 scenario "They click on a add to cart button" do
   # ACT
   visit root_path

   # DEBUG / VERIFY
  
   button = page.find('.btn.btn-primary', match: :first)

   button.click

   within('nav') {expect(page).to have_content(' My Cart (1)')}

  #  save_screenshot
 end

end