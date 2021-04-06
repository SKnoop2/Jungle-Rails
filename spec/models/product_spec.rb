require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should save when all fields filled out" do
      @category = Category.new(name: "test_category")
      @product = Product.new(
        name: "test_product", 
        price_cents: 1000, 
        quantity: 5, 
        category: @category )
      expect(@product).to be_valid
    end

    it "should not save when name is missing" do
      @category = Category.new(name: "test_category")
      @product = Product.new(
        name: nil, 
        price_cents: 1000, 
        quantity: 5, 
        category: @category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not save when price is missing" do
      @category = Category.new(name: "test_category")
      @product = Product.new(
        name: "test_product", 
        price_cents: nil, 
        quantity: 5, 
        category: @category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should not save when quantity is missing" do
      @category = Category.new(name: "test_category")
      @product = Product.new(
        name: "test_product", 
        price_cents: 1000, 
        quantity: nil, 
        category: @category )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it "should not save when category is missing" do
      @category = Category.new(name: "test_category")
      @product = Product.new(
        name: "test_product", 
        price_cents: 1000, 
        quantity: 5, 
        category: nil )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end