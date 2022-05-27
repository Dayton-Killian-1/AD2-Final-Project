class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :whiteteamcolor
      t.string :blackteamcolor
      t.string :boardposition
      t.string :winner
      t.string :movehistory
      t.string :turn, default: "white"

      t.timestamps
    end
  end
end
