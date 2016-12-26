
React = require 'react'
recorder = require 'actions-in-recorder'
marked = require 'marked'

{div} = React.DOM

aboutMd = require '../posts/about.md'
guideMd = require '../posts/guide.md'
apiMd = require '../posts/api.md'
debuggerMd = require '../posts/debugger.md'
philosophyMd = require '../posts/philosophy.md'
routerMd = require '../posts/router.md'
historyMd = require '../posts/history.md'

styleContainer =
  padding: 32
  overflow: 'auto'

styleSpace =
  height: 200

onHome = ->
  recorder.dispatch 'router/nav', '/'

onDemo = ->
  recorder.dispatch 'router/nav', '/demo'

module.exports = React.createClass
  render: ->
    content = switch @props.router.get('name')
      when 'index.html' then aboutMd
      when 'home' then aboutMd
      when 'guide.html' then guideMd
      when 'api.html' then apiMd
      when 'debugger.html' then debuggerMd
      when 'philosophy.html' then philosophyMd
      when 'router.html' then routerMd
      when 'history.html' then historyMd
      else '404 content'
    div style: styleContainer, className: 'markdown-content',
      div dangerouslySetInnerHTML: {__html: marked(content)}
      div style: styleSpace
