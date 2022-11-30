" command to run our plugin
command! -nargs=* ScribbleOpen lua require("scribble").open(<f-args>)
command! ScribbleFind lua require("scribble").find()
command! ScribbleNew lua require("scribble").new()

