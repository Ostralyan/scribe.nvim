" command to run our plugin
command! -nargs=* ScribOpen lua require("scrib").open(<f-args>)
command! ScribFind lua require("scrib").find()
command! ScribNew lua require("scrib").new()

