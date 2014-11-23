class Player < ActiveRecord::Base
	scope :ordered, ->{ order('score desc') }
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :score, :numericality => {:only_integer => true}
	before_save :set_ranks_for_new, :if => Proc.new { |obj| obj.rank.nil? }
	before_destroy :set_ranks_for_destroy

	private
		def set_ranks_for_new
		  records = Player.ordered.all
	      lower_rank = false
	      write_attribute(:rank, records.count+1)
	      records.each do |record| 		
 	      	if self.score >= record.score && lower_rank == false
 	      		write_attribute(:rank, record.rank)
 	      		lower_rank = true
 	      		if record.score != self.score
 	      			record.rank += 1
 	      			record.save
 	      		end
 	      	elsif lower_rank 
 	      		record.rank +=1
 	      		record.save
 	      	end 
	      end
	    end

	    def set_ranks_for_destroy
	    	records = Player.ordered.all
	    	records.each do |record|
	    		if record.score < self.score
	    			record.rank -= 1
	    			record.save
	    		end
	    	end
	    end
end
