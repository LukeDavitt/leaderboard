class Player < ActiveRecord::Base
	scope :descending, ->{ order('score desc') }
	scope :ascending, ->{ order('score asc')}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :score, :numericality => {:only_integer => true}
	
	def show_rank
		records = Player.descending.all
		rank = nil 
		records.each_with_index do |player, index| 			
			if self.id == player.id
				rank = index + 1
			end
		end
		rank
	end
end
