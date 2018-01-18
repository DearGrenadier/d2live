desc 'Obtain leagues info'
task obtain_leagues_info: :environment do
  Dota.configure do |config|
    config.api_key = ENV.fetch('STEAM_API_KEY')
  end
  api = Dota.api
  logger = Logger.new(File.open('log/obtain_leagues_info.log', 'a'), 'weekly')
  logger.formatter = proc do |severity, datetime, progname, msg|
    "#{datetime.strftime('%d/%m/%y %H:%M:%S %Z')}  --  #{msg}\n"
  end

  api.leagues.each do |league|
    league_id = league.raw.delete('leagueid')
    unless League.exists?(league_id)
      League.create!(id: league_id, raw: league.raw)
      logger.info "Save info about #{league.raw.fetch('name')}"
    end
  end

  logger.close
end
