require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user = User.create(
      first_name: "Hello", 
      last_name: "World", 
      email: "hello@world.com", 
      password: "notASafePassword", 
      password_confirmation: "notASafePassword"
    )
  end
  
  describe 'Validations' do

    it "should create user when all fields filled out" do
      expect(@user).to be_valid
    end

    it "should not create user when password and password confirmation do not match" do
      @user.password = "notASafePassword", 
      @user.password_confirmation = "SafePassword"
      expect(@user).to_not be_valid
    end

    it "should not create user when password confirmation is missing" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "should not create user when first name is missing" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "should not create user when last name is missing" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "should not create user when email is missing" do
      @user.email = nil 
      expect(@user).to_not be_valid
    end

    it "should not create user when email already exists in database" do
      user2 = User.create(
        first_name: "Greetings", 
        last_name: "Globe", 
        email: "HELLO@world.com", 
        password: "GetABetterPassword", 
        password_confirmation: "GetABetterPassword")
      expect(user2).to_not be_valid
    end

    it "should not create user when password is less than 6 characters" do
      @user.password = "duh",
      @user.password_confirmation = "duh"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should authenticate user when all fields filled out correctly" do
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end

    it "should authenticate user when extra spaces added to email field" do
      email_with_spaces = "   hello@world.com"
      expect(User.authenticate_with_credentials(email_with_spaces, @user.password)).to eq(@user)
    end

    it "should authenticate user when email has capital letters" do
      email_with_caps = "HellO@woRld.com"
      expect(User.authenticate_with_credentials(email_with_caps, @user.password)).to eq(@user)
    end
  end
end
