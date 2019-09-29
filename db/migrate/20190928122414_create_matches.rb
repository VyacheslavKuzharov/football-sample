class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :started_at
      t.references :home_team
      t.references :guest_team

      t.timestamps
    end
  end
end
