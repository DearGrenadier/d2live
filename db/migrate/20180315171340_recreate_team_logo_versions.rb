class RecreateTeamLogoVersions < ActiveRecord::Migration[5.1]
  def change
    Team.find_each do |team|
      team.logo.recreate_versions! if team.logo?
    end
  end
end
