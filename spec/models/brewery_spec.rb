require 'rails_helper'

RSpec.describe Brewery, type: :model do
  let(:attributes) do
    { name: "Beer Brewery" }
  end

  it "is considered valid" do 
    expect(Brewery.new(attributes)).to be_valid
  end

end
