docker:
	docker-compose -f docker-compose.yaml up --build
graphql:
	go run github.com/99designs/gqlgen generate
init:
	go run github.com/99designs/gqlgen init 
run:
	go run main.go
build:
	docker compose up --build
run-docker:
	docker compose up 
