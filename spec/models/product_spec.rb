require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be able to be created' do   #
      @category = Category.create name: 'food'
      @product = Product.create name: 'Lightning launcher', description: 'shoots lightning bolts', price_cents: 4000, quantity: 12, category_id: @category.id

      expect(@product).to be_valid
    end

    it 'should not be able to be created without a name' do   #
      @category = Category.create name: 'food'
      @product = Product.create description: 'shoots lightning bolts', price_cents: 4000, quantity: 12, category_id: @category.id

      expect(@product).to_not be_valid
    end

    it 'should not be able to be created without a price' do   #
      @category = Category.create name: 'food'
      @product = Product.create description: 'shoots lightning bolts', quantity: 12, category_id: @category.id

      expect(@product).to_not be_valid
    end

    it 'should not be able to be created without a quantity' do   #
      @category = Category.create name: 'food'
      @product = Product.create description: 'shoots lightning bolts', price_cents: 4000, category_id: @category.id

      expect(@product).to_not be_valid
    end

    it 'should not be able to be created without a category' do   #
    
      @product = Product.create description: 'shoots lightning bolts', price_cents: 4000, quantity: 12

      expect(@product).to_not be_valid
    end

  end

  describe "Associations" do
    it "should have many reviews" do
      assc = described_class.reflect_on_association(:reviews)
      expect(assc.macro).to eq :has_many
    end
  
    it "should belong to category" do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
  end

end
