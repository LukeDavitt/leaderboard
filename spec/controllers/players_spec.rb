require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET show" do
    it "shows a player" do
      player = FactoryGirl.create(:player)
      
      get :show, id: player
      expect(assigns(:player)).to eq(player)
    end
    it "renders the #show view" do 
		get :show, id: FactoryGirl.create(:player) 
	  	expect(response).to render_template(:show)
	end
	it "returns a 404 if player doesnt exist" do  
	  player = Player.create(first_name:"something", last_name:"else", score: 0)
	  player.id = 20000
      get :show, id: player
      expect(response).to render_template(:file => "#{Rails.root}/public/404.html")
    end
  end

 
end
