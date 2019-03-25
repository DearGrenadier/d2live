class CreateHeroesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :heroes do |t|
      t.json :raw, null: false

      t.timestamps
    end
  end
end
