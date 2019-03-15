class RemoveAmateurLeagues < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL.squish
      DELETE FROM leagues
      WHERE raw ->> 'tier' = 'amateur' OR raw ->> 'tier' = 'excluded' OR raw ->> 'tier' IS NULL
    SQL
  end

  def down; end
end
