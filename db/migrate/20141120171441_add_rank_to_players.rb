class AddRankToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :rank, :int
  end
end
