package debugapp

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"log"
)

// Response is the structure returned by the echo server.
type Response struct {
	Host        string              `json:"host"`
	Method      string              `json:"method"`
	URI         string              `json:"uri"`
	HTTPVersion string              `json:"httpVersion"`
	Time        time.Time           `json:"time"`
	RemoteAddr  string              `json:"remoteAddr"`
	TLS         bool                `json:"tls"`
	Header      map[string][]string `json:"header"`
	Msg         string              `json:"message"`
}

// RunHTTPServer runs HTTP and HTTPS goroutines and blocks.
func RunHTTPServer(ctx context.Context) {
	http.HandleFunc("/", debugapp)

	go func() {
		if AppFlag.HTTPSPort == 0 {
			return
		}

		server := &http.Server{Addr: fmt.Sprintf(":%d", AppFlag.HTTPSPort)}
		cert, key := createCert()
		err := server.ListenAndServeTLS(cert, key)
		if err != nil {
			log.Fatal(err)
		}

		<-ctx.Done()
		server.Shutdown(ctx)
	}()

	go func() {
		if AppFlag.HTTPPort == 0 {
			return
		}

		server := &http.Server{Addr: fmt.Sprintf(":%d", AppFlag.HTTPPort)}
		err := server.ListenAndServe()
		if err != nil {
			log.Fatal(err)
		}

		<-ctx.Done()
		server.Shutdown(ctx)
	}()

	<-ctx.Done()
}

func debugapp(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	resp := Response{
		Host:        r.Host,
		Method:      r.Method,
		URI:         r.RequestURI,
		HTTPVersion: fmt.Sprintf("%d.%d", r.ProtoMajor, r.ProtoMinor),
		Time:        time.Now(),
		RemoteAddr:  r.RemoteAddr,
		Header:      r.Header,
		TLS:         r.TLS != nil,
		Msg:         "Hello, you've reached DebugApp!",
	}

	respJSON, err := json.MarshalIndent(resp, "", "  ")
	if err != nil {
		log.Printf("failed to marshal the resp: %v", err)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write(respJSON)
}
