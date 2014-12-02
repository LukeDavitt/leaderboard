class Player < ActiveRecord::Base
	scope :descending, ->{ order('score desc') }
	scope :ascending, ->{ order('score asc')}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :score, :numericality => {:only_integer => true}
	
end
