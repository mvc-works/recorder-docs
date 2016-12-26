
React = require 'react'
hsl = require 'hsl'
recorder = require 'actions-in-recorder'
{div, style} = React.DOM

styleContainer =
  width: '16%'
  padding: '32px 0px'
  fontWeight: 300

styleBody =
  padding: 0

styleEntry =
  cursor: 'pointer'
  lineHeight: '40px'
  padding: '0 32px'

inlineStyle = """
  .side-entry:hover {
    background-color: #{hsl 0, 0, 98};
  }
"""

onNav = (path) -> (event) ->
  recorder.dispatch 'router/nav', path

merge = (a, b) ->
  c = {}
  for k, v of a
    c[k] = v
  for k, v of b
    c[k] = v
  c

renderEntry = (router, title, path) ->
  moreStyle = if router.get('name') is path
    backgroundColor: hsl 0, 0, 100
  div
    onClick: onNav(path)
    className: 'side-entry'
    style: merge styleEntry, moreStyle
    title

module.exports = React.createClass
  render: ->
    router = @props.router

    div style: styleContainer,
      style dangerouslySetInnerHTML: {__html: inlineStyle}
      div style: styleBody,
        renderEntry router, 'About', 'home'
        renderEntry router, 'Guide', 'guide'
        renderEntry router, 'API', 'api'
        renderEntry router, 'Debugger', 'debugger'
        renderEntry router, 'Philosophy', 'philosophy'
        renderEntry router, 'Router', 'router'
        renderEntry router, 'History', 'history'
