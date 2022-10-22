package paginator

import (
	"testing"

	_ "github.com/GoAdminGroup/themes/sword"
	"github.com/svyatoch/himera/modules/config"
	"github.com/svyatoch/himera/plugins/admin/modules/parameter"
)

func TestGet(t *testing.T) {
	config.Initialize(&config.Config{Theme: "sword"})
	Get(Config{
		Size:         105,
		Param:        parameter.BaseParam().SetPage("7"),
		PageSizeList: []string{"10", "20", "50", "100"},
	})
}
