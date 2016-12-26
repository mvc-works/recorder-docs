
React = require 'react'
hsl = require 'hsl'
recorder = require 'actions-in-recorder'
{div, a, style} = React.DOM

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
  display: 'block'
  textDecoration: 'none'

inlineStyle = """
  .side-entry:hover {
    background-color: #{hsl 0, 0, 98};
  }
"""

onNav = (path) -> (event) ->
  event.preventDefault()
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
  a
    href: "/#{path}"
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
        renderEntry router, 'About', 'index.html'
        renderEntry router, 'Guide', 'guide.html'
        renderEntry router, 'API', 'api.html'
        renderEntry router, 'Debugger', 'debugger.html'
        renderEntry router, 'Philosophy', 'philosophy.html'
        renderEntry router, 'Router', 'router.html'
        renderEntry router, 'History', 'history.html'
