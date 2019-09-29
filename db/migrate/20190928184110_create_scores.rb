class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.references :match, foreign_key: true
      t.references :player, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :min_played, default: 0 # minutes played in match
      t.integer :goals, default: 0, index: true # goals in game
      t.integer :assists, default: 0, index: true # assists in game
      t.integer :yellow, default: 0, index: true # yellow cards in game

      t.timestamps
    end
  end
end
