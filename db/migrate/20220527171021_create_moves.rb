class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.boolean :accepted
      t.string :currentsetup
      t.string :setupifaccepted
      t.string :decidingteam
      t.integer :movecount, default: 1

      t.timestamps
    end
  end
end
