package main

import (
	"testing"

	"github.com/magiconair/properties/assert"
	"github.com/svyatoch/himera/modules/system"
)

func TestGetLatestVersion(t *testing.T) {
	assert.Equal(t, getLatestVersion(), system.Version())
}
