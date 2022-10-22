package gin

import (
	// add gin adapter

	ada "github.com/svyatoch/himera/adapter/gin"
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

	"github.com/gin-gonic/gin"
	"github.com/svyatoch/himera/engine"
	"github.com/svyatoch/himera/modules/config"
	"github.com/svyatoch/himera/modules/language"
	"github.com/svyatoch/himera/plugins/admin/modules/table"
	"github.com/svyatoch/himera/template"
	"github.com/svyatoch/himera/template/chartjs"
	"github.com/svyatoch/himera/tests/tables"
)

func internalHandler() http.Handler {
	r := gin.Default()

	gin.SetMode(gin.ReleaseMode)

	eng := engine.Default()

	template.AddComp(chartjs.NewChart())

	if err := eng.AddConfigFromJSON(os.Args[len(os.Args)-1]).
		AddGenerators(tables.Generators).
		AddGenerator("user", tables.GetUserTable).
		Use(r); err != nil {
		panic(err)
	}

	eng.HTML("GET", "/admin", tables.GetContent)

	r.Static("/uploads", "./uploads")

	return r
}

func NewHandler(dbs config.DatabaseList, gens table.GeneratorList) http.Handler {
	r := gin.Default()

	gin.SetMode(gin.ReleaseMode)

	eng := engine.Default()

	template.AddComp(chartjs.NewChart())

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
		AddAdapter(new(ada.Gin)).
		AddGenerators(gens).
		Use(r); err != nil {
		panic(err)
	}

	eng.HTML("GET", "/admin", tables.GetContent)

	r.Static("/uploads", "./uploads")

	return r
}
