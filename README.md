[![CircleCI](https://circleci.com/gh/DearGrenadier/d2live/tree/master.svg?style=svg)](https://circleci.com/gh/DearGrenadier/d2live/tree/master)
# Set up development
`cp .env.sample .env`

`docker-compose up --build`

`./ngrock http 3000`

`docker-compose run web set_webhook[ssl_ngrock_forwarding]`
