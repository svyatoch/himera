package example

import (
	"github.com/svyatoch/himera/context"
	"github.com/svyatoch/himera/modules/auth"
	"github.com/svyatoch/himera/modules/db"
	"github.com/svyatoch/himera/modules/service"
)

func (e *Example) initRouter(prefix string, srv service.List) *context.App {

	app := context.NewApp()
	route := app.Group(prefix)
	route.GET("/example", auth.Middleware(db.GetConnection(srv)), e.TestHandler)

	return app
}
