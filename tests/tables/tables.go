package tables

import "github.com/svyatoch/himera/plugins/admin/modules/table"

var Generators = map[string]table.Generator{
	"posts":    GetPostsTable,
	"authors":  GetAuthorsTable,
	"external": GetExternalTable,
}
