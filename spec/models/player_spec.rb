require 'rails_helper'

RSpec.describe Player, :type => :model do
  it "is valid with a firstname, lastname and rank"  do
  	  expect(build(:player)).to be_valid
   end
end
