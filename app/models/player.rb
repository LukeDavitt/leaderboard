class Player < ActiveRecord::Base
	scope :ordered, ->{ order('score desc') }
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :score, :numericality => {:only_integer => true}
end
