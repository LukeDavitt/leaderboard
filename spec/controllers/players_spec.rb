require 'rails_helper'

RSpec.describe PlayersController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  #TO DO write appropriate edit spec
end
