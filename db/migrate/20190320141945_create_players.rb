class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.json :raw, null: false
      t.belongs_to :team
      t.timestamps
    end
  end
end
