" command to run our plugin
command! -nargs=* ScribeOpen lua require("scribe").open(<f-args>)
command! ScribeFind lua require("scribe").find()
command! ScribeNew lua require("scribe").new()

