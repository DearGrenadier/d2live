set :output, 'log/whenever.log'
set :environment, :development

every 1.minute do
  rake 'track_matches'
end
