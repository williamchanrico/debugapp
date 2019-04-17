package main

import (
	"context"
	"flag"
	"log"

	"github.com/williamchanrico/debugapp/debugapp"
)

func main() {
	debugapp.RegisterFlags()
	flag.Parse()

	log.Println("starting debugapp server!")
	debugapp.RunHTTPServer(context.Background())
}
