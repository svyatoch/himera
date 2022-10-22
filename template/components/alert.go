package components

import (
	"html/template"

	"github.com/svyatoch/himera/modules/errors"
	"github.com/svyatoch/himera/modules/language"
	"github.com/svyatoch/himera/template/types"
)

type AlertAttribute struct {
	Name    string
	Theme   string
	Title   template.HTML
	Content template.HTML
	types.Attribute
}

func (compo *AlertAttribute) SetTheme(value string) types.AlertAttribute {
	compo.Theme = value
	return compo
}

func (compo *AlertAttribute) SetTitle(value template.HTML) types.AlertAttribute {
	compo.Title = value
	return compo
}

func (compo *AlertAttribute) SetContent(value template.HTML) types.AlertAttribute {
	compo.Content = value
	return compo
}

func (compo *AlertAttribute) Warning(msg string) template.HTML {
	return compo.SetTitle(errors.MsgWithIcon).
		SetTheme("warning").
		SetContent(language.GetFromHtml(template.HTML(msg))).
		GetContent()
}

func (compo *AlertAttribute) GetContent() template.HTML {
	return ComposeHtml(compo.TemplateList, compo.Separation, *compo, "alert")
}
