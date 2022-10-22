ALTER TABLE github.com/svyatoch/himera_menus
ADD COLUMN plugin_name character varying(150) NOT NULL DEFAULT '',
ADD COLUMN uuid character varying(150) NOT NULL DEFAULT '';