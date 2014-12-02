require 'rails_helper'

RSpec.describe Player, :type => :model do
  it "is valid with a firstname, lastname and rank"  do
  	  expect(build(:player)).to be_valid
  end
  
  it  "creates the appropriate rank on new player" do
  	for i in 0..10
  		#use the create method rather then build to call validation methods for rank
	   FactoryGirl.create(:player)
	end
	rank = 1
	players = Player.descending.all
	players.each do |player|
		expect(player.rank).to be >= rank
		rank = player.rank
	end
  end

  #TO DO write appropriate edit spec
end
