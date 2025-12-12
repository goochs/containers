package main

import (
	"context"
	"testing"

	"github.com/home-operations/containers/testhelpers"
)

func Test(t *testing.T) {
	ctx := context.Background()
	image := testhelpers.GetTestImage("ghcr.io/goochs/caddy:rolling")
	testhelpers.TestHTTPEndpoint(t, ctx, image,
		testhelpers.HTTPTestConfig{Port: "2019", Path: "/config/"},
		&testhelpers.ContainerConfig{Env: map[string]string{"CADDY_ADMIN": "0.0.0.0:2019"}})
}
