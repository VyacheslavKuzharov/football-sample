class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :club_title, null: false, index: true

      t.timestamps
    end
  end
end
