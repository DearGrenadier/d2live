class CreatePicks < ActiveRecord::Migration[5.1]
  def change
    create_table :picks do |t|
      t.belongs_to :match
      t.belongs_to :hero
      t.belongs_to :player
      t.boolean :radiant, null: false

      t.timestamps
    end

    add_index :picks, %i[match_id hero_id], unique: true
  end
end
