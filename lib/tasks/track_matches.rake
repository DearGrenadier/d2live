# frozen_string_literal: true

desc 'Track live matches info'
task track_matches: :environment do
  logger = Logger.new(File.open('log/track_matches.log', 'a'), 'weekly')
  logger.formatter = proc do |_severity, datetime, _progname, msg|
    "#{datetime.strftime('%d/%m/%y %H:%M:%S %Z')}  --  #{msg}\n"
  end

  live_matches = DOTA_CLIENT.live_matches
  next logger.info 'There is no live matches' if live_matches.empty?

  pro_matches = live_matches.select { |match| match.league_tier.in? Match::PRO_TIERS.values }
  pro_match_ids = pro_matches.map do |pro_match|
    match_id = pro_match.raw.fetch('match_id')
    RegisterNewMatchWorker.perform_async(pro_match.raw) unless Match.exists?(match_id)
    match_id
  end

  live_match_ids = Match.live.map(&:id)

  finished_match_ids = live_match_ids - pro_match_ids
  Match.where(id: finished_match_ids).each do |match|
    RegisterFinishedMatchWorker.perform_async(match.id)
  end

  logger.info pro_match_ids.reduce('') { |memo, pro_match_id| memo.concat("| #{pro_match_id} |") }
  logger.close
end
