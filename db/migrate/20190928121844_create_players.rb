class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :team, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false, index: true

      t.timestamps
    end
  end
end
