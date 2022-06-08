require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(
        first_name: 'NOT',
        last_name: 'A-A-RON',
        email: 'NOT@AARON.com',
        password: '123456',
        password_confirmation: '123456'
      )
    end

    context 'User' do
      it 'should not be nil when all user fields are populated' do
        @user.save

        expect(@user).not_to be_nil
      end
    end


    context 'Password' do
      it 'should throw an error if password is empty' do
        @user.password = nil
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end

      
      it 'should throw an error if password confirmation is empty' do
        @user.password_confirmation = nil
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end

      
      it "should throw an error if passwords don't match" do
        @user.password_confirmation = "rickflip"
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end
      
      
      it 'should throw an error if password is less than 6 characters' do
        @user.password = "123"
        @user.password_confirmation = "123"
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end
    end

    
    context 'Email' do
      it 'should be unique and case insensitive' do
        @user.save
        
        @user_has_same_email = User.create(
          first_name: 'NOT',
          last_name: 'NOONA',
          email: 'not@aaron.com',
          password: 'GOAWAY',
          password_confirmation: 'GOAWAY'
          )
          
        expect(@user_has_same_email.errors.full_messages).not_to be_empty
      end


      it 'should throw an error if email is empty' do
        @user.email = nil
        @user.save
        
        expect(@user.errors.full_messages).not_to be_empty
      end
    end
      
    context 'Name' do
      it 'should throw an error if first name is empty' do
        @user.first_name = nil
        @user.save

        expect(@user.errors.full_messages).not_to be_empty
      end
      
      
      it 'should throw an error if last name is empty' do
        @user.last_name = nil
        @user.save
  
        expect(@user.errors.full_messages).not_to be_empty
      end
    end


    after(:each) do
      @user.destroy
      @user_has_same_email.destroy unless @user_has_same_email.nil?
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.create(
        first_name: 'NOT',
        last_name: 'A-A-RON',
        email: 'not@aaron.com',
        password: 'notaaron',
        password_confirmation: 'notaaron'
      )
    end


    it "should be false if passwords don't match at login" do
      @user = User.authenticate_with_credentials('not@aaron.com', 'noraaton')

      expect(@user).to be_falsey
    end
    
    
    it 'should be true if passwords match at login' do
      @user = User.authenticate_with_credentials('not@aaron.com', 'notaaron')
      
      expect(@user).to be_truthy
    end
    
    
    it 'should be true if email has extra spaces and passwords match' do
      @user = User.authenticate_with_credentials('   not@aaron.com   ', 'notaaron')
      
      expect(@user).to be_truthy
    end
    

    it 'should be true if email contains uppercase characters and passwords match' do
      @user = User.authenticate_with_credentials('NOT@aaron.com', 'notaaron')
      
      expect(@user).to be_truthy
    end


    it 'should be nil if email is incorrect and passwords match' do
      @user = User.authenticate_with_credentials('nottt@arrrron.com', 'notaaron')
      
      expect(@user).to be_nil
    end
  end
end