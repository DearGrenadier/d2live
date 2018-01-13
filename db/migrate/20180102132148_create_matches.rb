class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.json :raw, null: false
      t.boolean :finished, null: false, default: false
    end
  end
end
