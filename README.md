[![CircleCI](https://circleci.com/gh/DearGrenadier/d2live/tree/master.svg?style=svg)](https://circleci.com/gh/DearGrenadier/d2live/tree/master)
# Set up development
`cp .env.sample .env`

`ngrok http 3000`

`docker-compose run web rake set_webhook\[ssl_ngrock_forwarding]\`

`docker-compose up --build`


# Seed the database, run following jobs
`FetchLeaguesInfoWorker.perform_async`
`FetchTeamsInfoWorker.perform_async`
`FetchProPlayersInfoWorker.perform_async`
`FetchHeroesInfoWorker.perform_async`
