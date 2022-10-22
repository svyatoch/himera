package guard

import (
	"html/template"
	"strconv"

	"github.com/svyatoch/himera/context"
	"github.com/svyatoch/himera/modules/auth"
	"github.com/svyatoch/himera/modules/errors"
	"github.com/svyatoch/himera/plugins/admin/modules/form"
)

type MenuNewParam struct {
	Title      string
	Header     string
	ParentId   int64
	Icon       string
	PluginName string
	Uri        string
	Roles      []string
	Alert      template.HTML
}

func (e MenuNewParam) HasAlert() bool {
	return e.Alert != template.HTML("")
}

func (g *Guard) MenuNew(ctx *context.Context) {

	parentId := ctx.FormValue("parent_id")
	if parentId == "" {
		parentId = "0"
	}

	var (
		alert template.HTML
		token = ctx.FormValue(form.TokenKey)
	)

	if !auth.GetTokenService(g.services.Get(auth.TokenServiceKey)).CheckToken(token) {
		alert = getAlert(errors.EditFailWrongToken)
	}

	if alert == "" {
		alert = checkEmpty(ctx, "title", "icon")
	}

	parentIdInt, _ := strconv.Atoi(parentId)

	ctx.SetUserValue(newMenuParamKey, &MenuNewParam{
		Title:      ctx.FormValue("title"),
		Header:     ctx.FormValue("header"),
		PluginName: ctx.FormValue("plugin_name"),
		ParentId:   int64(parentIdInt),
		Icon:       ctx.FormValue("icon"),
		Uri:        ctx.FormValue("uri"),
		Roles:      ctx.Request.Form["roles[]"],
		Alert:      alert,
	})
	ctx.Next()
}

func GetMenuNewParam(ctx *context.Context) *MenuNewParam {
	return ctx.UserValue[newMenuParamKey].(*MenuNewParam)
}
