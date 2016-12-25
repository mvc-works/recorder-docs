
React = require 'react'
hsl = require 'hsl'
recorder = require 'actions-in-recorder'
{div, style} = React.DOM

styleContainer =
  width: '16%'
  padding: '16px 0px'

styleBody =
  padding: 0

styleEntry =
  cursor: 'pointer'
  lineHeight: '40px'
  padding: '0 16px'

inlineStyle = """
  .side-entry:hover {
    background-color: #{hsl 0, 0, 96};
  }
"""

onNav = (path) -> (event) ->
  recorder.dispatch 'router/nav', path

renderEntry = (title, path) ->
  div onClick: onNav(path), style: styleEntry, className: 'side-entry',
    title

module.exports = React.createClass
  render: ->
    div style: styleContainer,
      style dangerouslySetInnerHTML: {__html: inlineStyle}
      div style: styleBody,
        renderEntry 'About', 'home'
        renderEntry 'Guide', 'guide'
        renderEntry 'API', 'api'
        renderEntry 'Philosophy', 'philosophy'
        renderEntry 'Router', 'router'
