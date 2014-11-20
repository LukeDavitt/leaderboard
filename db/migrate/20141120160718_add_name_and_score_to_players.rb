class AddNameAndScoreToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :name, :string
    add_column :players, :score, :int
  end
end
