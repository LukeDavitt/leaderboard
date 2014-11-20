class PlayersController < ApplicationController
	
	respond_to :html, :json
	before_action :load_player, only: [:show, :edit, :update, :destroy]

	def index (offset=0, number_of_entries=10)
		if number_of_entries > 100
			number_of_entries = 100
		end
		if offset + 1 > Player.count
			not_found
		else
			@players = Player.ordered.limit(number_of_entries).offset(offset)
			respond_with @players	
		end	
	end

	def show
		unless @player.nil?
		  respond_with @player
		end
	end

	def new
		@player = Player.new
    	respond_with @player
	end

	def create
	  players = Player.ordered.all	
	  rank = players.count+1
	  reduce_rank = false
	  @player = Player.new(player_params)
	  players.each do |player|
	  	if @player.score >= player.score && reduce_rank == false
	  		rank = player.rank
	  		if player.score < @player.score
	  		   reduce_player_rank(player)
	  		end
	  		reduce_rank = true
	  	elsif @player.score > player.score
	  		reduce_player_rank(player)
	  	end 
	  end

	  @player.rank = rank
	  @player.save
 	  
	  flash[:notice] = 'Player was successfully created.'
	  respond_with @player, :location => players_path	  
	   
	end
	
	def reduce_player_rank(player)
		new_rank = player.rank + 1
  		player.rank = new_rank
  		player.save
	end

	def increase_player_rank(score)
		players = Player.ordered.all
		players.each do |player|
			if player.score < score
				player.rank = player.rank - 1
				player.save
			end
		end
	end

	def update
		if @player.update(player_params)
	      flash[:notice] = 'Player was successfully updated.'
	    end
	    respond_with @player, :location => players_path
	end

	def destroy
		score = @player.score
		if @player.destroy
			increase_player_rank(score)
			redirect_to :action => 'index'
		else
			not_found
		end
	end

	private

	  def load_player
	    @player = Player.find(params[:id]) || not_found	    
	  end

	  def player_params
	    params.require(:player).permit(:name, :score)
	  end

	  rescue_from ActiveRecord::RecordNotFound do
		flash[:notice] = 'The object you tried to access does not exist'
		not_found   # or e.g. redirect_to :action => :index
	   end

end
