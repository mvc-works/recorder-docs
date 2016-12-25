
React = require 'react'
recorder = require 'actions-in-recorder'
marked = require 'marked'

{div} = React.DOM

aboutMd = require '../posts/about.md'
guideMd = require '../posts/guide.md'
apiMd = require '../posts/api.md'
philosophyMd = require '../posts/philosophy.md'
routerMd = require '../posts/router.md'

styleContainer =
  padding: 16

onHome = ->
  recorder.dispatch 'router/nav', '/'

onDemo = ->
  recorder.dispatch 'router/nav', '/demo'

module.exports = React.createClass
  render: ->
    content = switch @props.router.get('name')
      when 'home' then aboutMd
      when 'guide' then guideMd
      when 'api' then apiMd
      when 'philosophy' then philosophyMd
      when 'router' then routerMd
      else '404 content'
    div style: styleContainer,
      div dangerouslySetInnerHTML: {__html: marked(content)}
