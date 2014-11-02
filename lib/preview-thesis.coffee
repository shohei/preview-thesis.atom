PreviewThesisView = require './preview-thesis-view'

module.exports =
  activate: ->
    # コマンドと実行する関数を登録する
    atom.workspaceView.command "preview-thesis:show", => @show()

  show: ->
    command = """
      zsh -c 'cd /Users/shohei/Dropbox/Thesis && pdfplatex $0' main.tex
    """
    command2 = """
      zsh -c 'cd /Users/shohei/Dropbox/Thesis && open -a /Applications/Skim.app/Contents/MacOS/Skim $0' main.pdf
    """
    command3 = """

    """
    console.log(command)
    exec = require('child_process').exec

    execCmd = (cmd) ->
      exec cmd,
        timeout: 100000
      , (error, stdout, stderr) ->
          console.log "execCmd fired to " + cmd
          console.log stdout
          console.log "exec error: " + error  if error isnt null
          return
    execCmd command
    execCmd command2

    console.log('SUCCESS')
