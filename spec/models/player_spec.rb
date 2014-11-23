require 'rails_helper'

RSpec.describe Player, :type => :model do
  it "is valid with a firstname, lastname and rank"  do
  	  expect(build(:player)).to be_valid
  end
  #TO DO  write appropriate test for testing rank
  it  "has the appropriate rank do" do
  	player_1 = build(:player)
  	player_2 = build(:player)
  	puts player_1.rank
  	puts player_2.rank
  end
end
