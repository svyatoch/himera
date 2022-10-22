package tests

import (
	"testing"
	"time"

	"github.com/svyatoch/himera/modules/config"
	"github.com/svyatoch/himera/tests/frameworks/gin"
)

func TestBlackBoxTestSuitOfBuiltInTables(t *testing.T) {
	BlackBoxTestSuitOfBuiltInTables(t, gin.NewHandler, config.DatabaseList{
		"default": {
			Host:            "127.0.0.1",
			Port:            "3306",
			User:            "root",
			Pwd:             "root",
			Name:            "go-admin-test",
			MaxIdleConns:    50,
			MaxOpenConns:    150,
			ConnMaxLifetime: time.Hour,
			ConnMaxIdleTime: 0,
			Driver:          config.DriverMysql,
		},
	})
}
