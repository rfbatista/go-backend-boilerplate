package main

import (
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/go-chi/chi"
	"github.com/rfbatista/go-backend-boilerplate/graph/generated"
	"github.com/rfbatista/go-backend-boilerplate/graph/resolvers"
	"github.com/rfbatista/go-backend-boilerplate/pkg"
)

const defaultPort = "8080"

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = defaultPort
	}
  pkg.InitializeLogger()
	r := chi.NewRouter()
	srv := handler.NewDefaultServer(generated.NewExecutableSchema(generated.Config{Resolvers: &resolvers.Resolver{}}))
  
	r.Get("/", playground.Handler("GraphQL playground", "/query"))
	r.Handle("/query", srv)

	pkg.Logger.Infof("connect to http://localhost:%s/ for GraphQL playground", port)
	http.ListenAndServe(":"+port, r)
}
