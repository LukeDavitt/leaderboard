class PlayersController < ApplicationController
	
	respond_to :html, :json
	before_action :load_player, only: [:show, :edit, :update, :destroy]

	def index
		@players = Player.descending.all
		respond_with @players		
	end

	def show
		if Player.where(id: @player.id).empty?
			not_found
		else
			respond_with @player
		end
	end

	def new
		@player = Player.new
    	respond_with @player
	end

	def create
	  @player = Player.new(player_params)
	  @player.save
 	  
	  flash[:notice] = 'Player was successfully created.'
	  respond_with @player, :location => players_path	  
	   
	end
	
	def update
		if @player.update(player_params)
		  @player.set_rank_for_edit
	      flash[:notice] = 'Player was successfully updated.'
	    end
	    respond_with @player, :location => players_path
	end

	def destroy
		@player.destroy
		redirect_to :action => 'index'
	end

	private

	  def load_player
	    @player = Player.find(params[:id]) || not_found	    
	  end

	  def player_params
	    params.require(:player).permit(:first_name, :last_name, :score)
	  end

	  rescue_from ActiveRecord::RecordNotFound do
		flash[:notice] = 'The object you tried to access does not exist'
		not_found   # or e.g. redirect_to :action => :index
	   end

end
