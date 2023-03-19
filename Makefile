BINARY_NAME=boilerplate
.DEFAULT_GOAL := run

build:
	GOARCH=amd64 GOOS=linux go build -o ./target/${BINARY_NAME}-linux cmd/server/main.go
run: build
	./target/${BINARY_NAME}-linux
docker:
	docker-compose -f docker-compose.yaml up --build
graphql:
	go run github.com/99designs/gqlgen generate
init:
	go run github.com/99designs/gqlgen init 
crun:
	go run cmd/server/main.go
dbuild:
	docker compose up --build
run-docker:
	docker compose up 
