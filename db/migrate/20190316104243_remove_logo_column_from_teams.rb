class RemoveLogoColumnFromTeams < ActiveRecord::Migration[5.1]
  def up
    remove_column :teams, :logo
  end

  def down
    add_column :teams, :logo, :string, null: false
  end
end
