package controller

import (
	"github.com/svyatoch/himera/context"
	"github.com/svyatoch/himera/modules/logger"
	"github.com/svyatoch/himera/plugins/admin/modules/guard"
	"github.com/svyatoch/himera/plugins/admin/modules/response"
)

// Delete delete the row from database.
func (h *Handler) Delete(ctx *context.Context) {

	param := guard.GetDeleteParam(ctx)

	//token := ctx.FormValue("_t")
	//
	//if !auth.TokenHelper.CheckToken(token) {
	//	ctx.SetStatusCode(http.StatusBadRequest)
	//	ctx.WriteString(`{"code":400, "msg":"delete fail"}`)
	//	return
	//}

	if err := h.table(param.Prefix, ctx).DeleteData(param.Id); err != nil {
		logger.Error(err)
		response.Error(ctx, "delete fail")
		return
	}

	response.OkWithData(ctx, map[string]interface{}{
		"token": h.authSrv().AddToken(),
	})
}
