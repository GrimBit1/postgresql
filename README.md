## to start the db
`docker-compose up -d`


## to stop the db
`docker-compose down`

## to connect to db
`docker-compose db exec psql -W`

## Connect with username 
`docker-compose exec db psql -U postgres -W` 
