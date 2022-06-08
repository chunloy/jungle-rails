require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    
  context 'create new product with a category' do
    before(:each) do
      @category = Category.create(name: 'Bonsai')

      @product = @category.products.new(
        name: 'Snow rose',
        price: '9999.99',
        quantity: 4
      )
    end
    
    it 'should not be nil when all fields are present' do
      @product.save

      expect(@product).not_to be_nil
    end


    it 'should be nil when price is empty' do
      @product[:name] = nil
      @product.save

      expect(@product.errors.full_messages).not_to be_empty
    end
    

    it 'should be nil when price is not present' do
      @product[:price_cents] = nil
      @product.save
      
      expect(@product.errors.full_messages).not_to be_empty
    end
    

    it 'should be nil when quantity is not present' do
      @product[:quantity] = nil
      @product.save
      
      expect(@product.errors.full_messages).not_to be_empty
    end

  
    after(:each) do
      @product.destroy
      @category.destroy
    end
  end


  context 'create a product without a category' do
    it 'should not create a product without a category' do
      @new_product = Product.create(
        name: 'Snow rose',
        price: '9999.99',
        quantity: 4
      )
      
      expect(@new_product.errors.full_messages).not_to be_empty
      end
    end
  end
end
