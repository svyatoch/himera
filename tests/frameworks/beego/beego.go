package beego

import (
	// add beego adapter
	_ "github.com/svyatoch/himera/adapter/beego"
	"github.com/svyatoch/himera/modules/config"
	"github.com/svyatoch/himera/modules/language"
	"github.com/svyatoch/himera/plugins/admin/modules/table"

	// add mysql driver
	_ "github.com/svyatoch/himera/modules/db/drivers/mysql"
	// add postgresql driver
	_ "github.com/svyatoch/himera/modules/db/drivers/postgres"
	// add sqlite driver
	_ "github.com/svyatoch/himera/modules/db/drivers/sqlite"
	// add mssql driver
	_ "github.com/svyatoch/himera/modules/db/drivers/mssql"
	// add adminlte ui theme
	"github.com/GoAdminGroup/themes/adminlte"

	"net/http"
	"os"

	"github.com/astaxie/beego"
	"github.com/svyatoch/himera/engine"
	"github.com/svyatoch/himera/plugins/admin"
	"github.com/svyatoch/himera/plugins/example"
	"github.com/svyatoch/himera/template"
	"github.com/svyatoch/himera/template/chartjs"
	"github.com/svyatoch/himera/tests/tables"
)

func internalHandler() http.Handler {

	app := beego.NewApp()

	eng := engine.Default()
	adminPlugin := admin.NewAdmin(tables.Generators)
	adminPlugin.AddGenerator("user", tables.GetUserTable)

	examplePlugin := example.NewExample()

	if err := eng.AddConfigFromJSON(os.Args[len(os.Args)-1]).
		AddPlugins(adminPlugin, examplePlugin).Use(app); err != nil {
		panic(err)
	}

	template.AddComp(chartjs.NewChart())

	eng.HTML("GET", "/admin", tables.GetContent)

	beego.BConfig.Listen.HTTPAddr = "127.0.0.1"
	beego.BConfig.Listen.HTTPPort = 9087

	return app.Handlers
}

func NewHandler(dbs config.DatabaseList, gens table.GeneratorList) http.Handler {

	app := beego.NewApp()

	eng := engine.Default()
	adminPlugin := admin.NewAdmin(gens)

	if err := eng.AddConfig(&config.Config{
		Databases: dbs,
		UrlPrefix: "admin",
		Store: config.Store{
			Path:   "./uploads",
			Prefix: "uploads",
		},
		Language:    language.EN,
		IndexUrl:    "/",
		Debug:       true,
		ColorScheme: adminlte.ColorschemeSkinBlack,
	}).
		AddPlugins(adminPlugin).Use(app); err != nil {
		panic(err)
	}

	template.AddComp(chartjs.NewChart())

	eng.HTML("GET", "/admin", tables.GetContent)

	beego.BConfig.Listen.HTTPAddr = "127.0.0.1"
	beego.BConfig.Listen.HTTPPort = 9087

	return app.Handlers
}
