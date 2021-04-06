require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "should save when all fields filled out" do
    @user = User.create(
      first_name: "Hello", 
      last_name: "World", 
      email: "hello@world.com", 
      password: "notASafePassword", 
      password_confirmation: "notASafePassword")
    expect(@user).to be_valid
  end

  it "should not save when password and password confirmation do not match" do
    @user = User.create(
      first_name: "Hello", 
      last_name: "World", 
      email: "hello@world.com", 
      password: "notASafePassword", 
      password_confirmation: "SafePassword")
    expect(@user).to_not be_valid
  end

  it "should not save when first name is missing" do
    @user = User.create(
      first_name: nil, 
      last_name: "World", 
      email: "hello@world.com", 
      password: "notASafePassword", 
      password_confirmation: "SafePassword")
    expect(@user).to_not be_valid
  end

  it "should not save when last name is missing" do
    @user = User.create(
      first_name: "Hello", 
      last_name: nil, 
      email: "hello@world.com", 
      password: "notASafePassword", 
      password_confirmation: "SafePassword")
    expect(@user).to_not be_valid
  end

  it "should not save when first name is missing" do
    @user = User.create(
      first_name: "Hello", 
      last_name: "World", 
      email: nil, 
      password: "notASafePassword", 
      password_confirmation: "SafePassword")
    expect(@user).to_not be_valid
  end

  it "should not save when email already exists in database" do
    user1 = User.create(
      first_name: "Hello", 
      last_name: "World", 
      email: "hello@world.com", 
      password: "notASafePassword", 
      password_confirmation: "SafePassword"
    )
    user2 = User.create(
      first_name: "Goodbye", 
      last_name: "Globe", 
      email: "HELLO@world.com", 
      password: "GetABetterPassword", 
      password_confirmation: "GetABetterPassword"
    )
    expect(user2).to_not be_valid
  end

end
