package example

import (
	c "github.com/svyatoch/himera/modules/config"
	"github.com/svyatoch/himera/modules/service"
	"github.com/svyatoch/himera/plugins"
)

type Example struct {
	*plugins.Base
}

func NewExample() *Example {
	return &Example{
		Base: &plugins.Base{PlugName: "example"},
	}
}

func (e *Example) InitPlugin(srv service.List) {
	e.InitBase(srv, "example")
	e.App = e.initRouter(c.Prefix(), srv)
}
