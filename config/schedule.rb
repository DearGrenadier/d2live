set :output, 'log/whenever.log'
set :environment, :development

every 1.minute do
  rake 'track_matches'
end

every 1.day do
  rake 'obtain_leagues_info'
end
