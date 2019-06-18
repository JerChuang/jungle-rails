require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @category = Category.create name: 'Weapons'
    
      @product1 = Product.create name: 'Flamethrower', description: 'breathes fire', price_cents: 4000, quantity: 5, category_id: @category.id
      @product2 = Product.create name: 'Lightning launcher', description: 'shoots lightning bolts', price_cents: 2000, quantity: 12, category_id: @category.id
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create name: 'Water pistol', description: 'squirts water', price_cents: 400, quantity: 112, category_id: @category.id

    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new email: 'email@email.com', total_cents: 10000, stripe_charge_id: 'stripe_charge'
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price_cents,
        total_price: @product1.price_cents * 2
      )
      @order.line_items.new(
        product: @product2,
        quantity: 1,
        item_price: @product2.price_cents,
        total_price: @product2.price_cents * 1
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq 3
    

    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      @order = Order.new email: 'email@email.com', total_cents: 10000, stripe_charge_id: 'stripe_charge'
        @order.line_items.new(
        product: @product1,
        quantity: 2,
        item_price: @product1.price_cents,
        total_price: @product1.price_cents * 2
      )
      @order.line_items.new(
        product: @product2,
        quantity: 1,
        item_price: @product2.price_cents,
        total_price: @product2.price_cents * 1
      )
      @order.save!
      @product1.reload
      @product2.reload
      @product3.reload
      expect(@product3.quantity).to eq 112
    end
  end
end
