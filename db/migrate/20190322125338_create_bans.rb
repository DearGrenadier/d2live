class CreateBans < ActiveRecord::Migration[5.1]
  def change
    create_table :bans do |t|
      t.belongs_to :hero
      t.belongs_to :match
      t.boolean :radiant, null: false

      t.timestamps
    end

    add_index :bans, %i[hero_id match_id], unique: true
  end
end
