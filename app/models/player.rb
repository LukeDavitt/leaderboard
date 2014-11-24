class Player < ActiveRecord::Base
	scope :descending, ->{ order('score desc') }
	scope :ascending, ->{ order('score asc')}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :score, :numericality => {:only_integer => true}
	before_save :set_ranks_for_new, :if => Proc.new { |obj| obj.rank.nil? }
	before_destroy :set_ranks_for_destroy

	def set_rank_for_edit
		records = Player.ascending.all
		
		records.each do |record|
			if record.score <= self.score && record.id != self.id
				write_attribute(:rank, record.rank)
				if record.score < self.score
					self.decrease_rank(record)
				end
			end
		end
		self.save
	end

	def decrease_rank(record)
		record.rank += 1
		record.save
	end

	def increase_rank(record)
		record.rank -= 1
	    record.save
	end
	
	private
		def set_ranks_for_new
		  records = Player.ascending.all
		  write_attribute(:rank, 1)
	      records.each do |record|
	      	if record.score < self.score
 	      		self.decrease_rank(record)
 	      	elsif record.score == self.score
 	      		write_attribute(:rank, record.rank)
 	      		break
 	      	else
 	      		write_attribute(:rank, record.rank+1)
 	      		break
 	      	end
	      end
	    end

	    def set_ranks_for_destroy
	    	records = Player.descending.all
	    	records.each do |record|
	    		if record.score < self.score
	    			self.increase_rank(record)
	    		end
	    	end
	    end
end
