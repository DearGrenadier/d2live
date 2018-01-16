desc 'Track live matches info'
task track_matches: :environment do
  Dota.configure do |config|
    config.api_key = ENV.fetch('STEAM_API_KEY')
  end
  api = Dota.api
  logger = Logger.new(File.open('log/matches_info.log', 'a'), 'weekly')
  logger.formatter = proc do |severity, datetime, progname, msg|
    "#{datetime.strftime('%d/%m/%y %H:%M:%S %Z')}  --  #{msg}\n"
  end

  live_matches = api.live_matches
  if live_matches.empty?
    logger.info "There is no live matches"
    next
  end

  pro_matches = live_matches.select { |match| match.league_tier.in? Match::PRO_TIERS.values }

  pro_matches.map! do |pro_match|
    match_id = pro_match.raw.delete('match_id')
    begin
      Match.create!(id: match_id, raw: pro_match.raw)
    rescue
      Match.find(match_id)
    end
  end

  live_match_ids = Match.live.map(&:id)
  finished_match_ids = live_match_ids - pro_matches.map(&:id)
  Match.where(id: finished_match_ids).each do |match|
    match.update!(finished: true)
  end

  logger.info pro_matches.reduce('') { |memo, pro_match| memo.concat("| #{pro_match.teams}|") }
  logger.close
end
