class Player < ActiveRecord::Base
	scope :ordered, ->{ order('score desc') }
	validates :name, presence: true
	validates :score, :numericality => {:only_integer => true}
end
