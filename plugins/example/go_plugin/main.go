package main

import (
	"github.com/svyatoch/himera/context"
	"github.com/svyatoch/himera/modules/auth"
	c "github.com/svyatoch/himera/modules/config"
	"github.com/svyatoch/himera/modules/db"
	"github.com/svyatoch/himera/modules/service"
	"github.com/svyatoch/himera/plugins"
)

type Example struct {
	*plugins.Base
}

var Plugin = &Example{
	Base: &plugins.Base{PlugName: "example"},
}

func (example *Example) InitPlugin(srv service.List) {
	example.InitBase(srv, "example")
	Plugin.App = example.initRouter(c.Prefix(), srv)
}

func (example *Example) initRouter(prefix string, srv service.List) *context.App {

	app := context.NewApp()
	route := app.Group(prefix)
	route.GET("/example", auth.Middleware(db.GetConnection(srv)), example.TestHandler)

	return app
}

func (example *Example) TestHandler(ctx *context.Context) {

}
