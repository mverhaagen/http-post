HttpPostView = require './http-post-view'

module.exports =
  httpPostView: null

  activate: (state) ->
    @httpPostView = new HttpPostView(state.httpPostViewState)

  deactivate: ->
    @httpPostView.destroy()

  serialize: ->
    httpPostViewState: @httpPostView.serialize()
