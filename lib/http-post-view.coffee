{View} = require 'atom'
http = require 'http'


module.exports =
class HttpPostView extends View
  @content: ->
    @div class: 'http-post overlay from-top', =>
      @div "The HttpPost package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    console.log "HttpPost - Initialize"
    atom.workspaceView.command "http-post:request", => @post()


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  usage:->
    atom.workspace.open("", split: 'right', changeFocus: true, searchAllPanes: true).done () ->
      editor = atom.workspace.activePaneItem

      editor.insertText """
        Usage:

        module.export = {
          hostname: "[Host IP or DNS]",
          path: "[Path for Resrouce]",
          method: "[GET | POST]",
          body: "[ - Optional - ]"
        }

      """


  execute: ->
    obj = {}
    editor = atom.workspace.activePaneItem
    obj = JSON.parse(editor.getText())
    atom.workspace.open("", split: 'right', changeFocus: true, searchAllPanes: true).done () ->
      editor = atom.workspace.activePaneItem
      options =
        hostname: obj.hostname
        port: 80
        path: obj.path
        method: obj.method
        body: obj.body || {}

      req = http.request options, (res) ->
        res.setEncoding "utf8"
        res.on "data", (chunk) ->
          editor.insertText(chunk)

      req.write('data')
      req.end()

  post: =>
    editor = atom.workspace.activePaneItem
    obj = JSON.parse(editor.getText())
    console.log obj

    if not obj.hostname or not obj.path or not obj.method
      @usage()
    else
      @execute()
