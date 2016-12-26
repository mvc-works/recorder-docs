
React = require 'react'
hsl = require 'hsl'
recorder = require 'actions-in-recorder'

Addressbar = React.createFactory require 'router-as-view'
Sidebar = React.createFactory require './sidebar'
Doc = React.createFactory require './doc'

routes = require '../routes'

{div} = React.DOM

styleContainer =
  fontFamily: 'Hind'
  position: 'absolute'
  height: '100%'
  width: '100%'
  display: 'flex'
  flexDirection: 'column'

styleHeader =
  height: 64
  backgroundColor: hsl 0, 0, 98
  color: hsl 0, 0, 60
  display: 'flex'
  alignItems: 'center'
  padding: '0 16px'
  fontFamily: 'Josefin Sans'
  fontWeight: 100
  fontSize: 40

styleBody =
  display: 'flex'
  flex: 1
  overflow: 'hidden'

module.exports = React.createClass
  displayName: 'app-container'

  render: ->
    div className: 'app-container', style: styleContainer,
      div style: styleHeader,
        'Actions in Recorder'
      div style: styleBody,
        Sidebar()
        Doc router: @props.store.get('router')
      Addressbar
        router: @props.store.get('router')
        routes: routes
        onPopstate: (info, event) ->
          recorder.dispatch 'router/go', info
        inHash: true
        skipRendering: false
