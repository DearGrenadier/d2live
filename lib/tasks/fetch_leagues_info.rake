desc 'Fetches leagues info'
task fetch_leagues_info: :environment do
  logger = Logger.new(File.open('log/fetch_leagues_info.log', 'a'), 'weekly')
  logger.formatter = proc do |_, datetime, _, msg|
    "#{datetime.strftime('%d/%m/%y %H:%M:%S %Z')}  --  #{msg}\n"
  end

  DOTA_CLIENT.leagues.each do |league|
    league_id = league.raw.delete('leagueid')
    unless League.exists?(league_id)
      League.create!(id: league_id, raw: league.raw)
      logger.info "Save info about #{league.raw.fetch('name')}"
    end
  end

  logger.close
end
