require 'rails_helper'

RSpec.describe User, type: :model do

  let(:attributes) do 
    {
      first_name: "John",
      last_name: "Smith",
      email: "John.Smith@gmail.com",
      password: "password",
    }
  end

  let(:missing_first_name) { attributes.except(:first_name) }
  let(:missing_last_name) { attributes.except(:last_name) }
  let(:missing_email) { attributes.except(:email) }
  let(:missing_password) { attributes.except(:password) }

  it "is considered valid" do 
    expect(User.new(attributes)).to be_valid
  end

  it "is invalid without first name" do 
    expect(User.new(missing_first_name)).not_to be_valid
  end

  it "is invalid without last name" do 
    expect(User.new(missing_last_name)).not_to be_valid
  end

  it "is invalid without email" do 
    expect(User.new(missing_email)).not_to be_valid
  end

  it "is invalid without password" do 
    expect(User.new(missing_password)).not_to be_valid
  end

end