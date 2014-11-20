class Player < ActiveRecord::Base
	scope :ordered, ->{ order('score desc') }
end
