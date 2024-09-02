class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :type
      t.string :winner
      t.string :player_names, array: true, default: []
      t.string :runner_up
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
