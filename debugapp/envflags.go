package debugapp

import (
	"flag"
	"os"
)

// AppFlag contains variables from command-line flags
var AppFlag struct {
	HTTPPort  int
	HTTPSPort int
}

// AppEnv contains variables from env
var AppEnv struct {
	Dummy string
}

func init() {
	AppEnv.Dummy = mustGetenv("DUMMY_NOT_USED", "DUMMY_DEFAULT_VALUE")
}

// RegisterFlags creates flags.
func RegisterFlags() {
	flag.IntVar(&AppFlag.HTTPPort, "http-port", 8080, "Port for HTTP, 0 will disable this protocol")
	flag.IntVar(&AppFlag.HTTPSPort, "https-port", 8443, "Port for HTTPS, 0 will disable this protocol")
}

// mustGetenv gets env value with default fallback
func mustGetenv(env, defaultValue string) string {
	if v := os.Getenv(env); v != "" {
		return v
	}
	return defaultValue
}
