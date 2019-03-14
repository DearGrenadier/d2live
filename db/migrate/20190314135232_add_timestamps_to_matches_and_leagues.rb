class AddTimestampsToMatchesAndLeagues < ActiveRecord::Migration[5.1]
  def up
    add_column :leagues, :created_at, :datetime, null: false, default: DateTime.now
    add_column :leagues, :updated_at, :datetime, null: false, default: DateTime.now
    add_column :matches, :created_at, :datetime, null: false, default: DateTime.now
    add_column :matches, :updated_at, :datetime, null: false, default: DateTime.now
  end

  def down
    remove_column :leagues, :created_at
    remove_column :leagues, :updated_at
    remove_column :matches, :created_at
    remove_column :matches, :updated_at
  end
end
