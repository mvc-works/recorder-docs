
React = require 'react'
hsl = require 'hsl'
recorder = require 'actions-in-recorder'

Addressbar = React.createFactory require 'router-as-view'
Sidebar = React.createFactory require './sidebar'
Doc = React.createFactory require './doc'

routes = require '../routes'

{div, a, span} = React.DOM

styleContainer =
  backgroundColor: hsl 200, 44, 94
  fontFamily: 'Hind'
  fontWeight: 300
  position: 'absolute'
  height: '100%'
  width: '100%'
  display: 'flex'
  flexDirection: 'column'

styleHeader =
  height: 64
  backgroundColor: 'white'
  color: hsl 0, 0, 60
  display: 'flex'
  justifyContent: 'space-between'
  alignItems: 'center'
  padding: '0 32px'
  fontFamily: 'Josefin Sans'
  fontWeight: 100
  fontSize: 20

styleLogo =
  fontSize: 40

styleBody =
  display: 'flex'
  flex: 1
  overflow: 'hidden'

repoUrl = 'https://github.com/mvc-works/actions-in-recorder'

module.exports = React.createClass
  displayName: 'app-container'

  render: ->
    router = @props.store.get 'router'

    div className: 'app-container', style: styleContainer,
      div style: styleHeader,
        span style: styleLogo, 'Actions in Recorder'
        a href: repoUrl, target: '_blank', 'GitHub'
      div style: styleBody,
        Sidebar router: router
        Doc router: router
      Addressbar
        router: router
        routes: routes
        onPopstate: (info, event) ->
          recorder.dispatch 'router/go', info
        inHash: false
        skipRendering: false
