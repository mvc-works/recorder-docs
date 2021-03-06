
fs = require 'fs'
stir = require('stir-template')
React = require 'react'
ReactDOM = require 'react-dom/server'
pathUtil = require 'router-as-view/lib/path'

require.extensions['.md'] = (module, filename) ->
  module.exports = fs.readFileSync filename, 'utf8'

routes = require '../src/routes'
schema = require '../src/schema'
settings = require('./settings')
resource = require('./resource')
Container = React.createFactory require('../src/app/container')

{html, head, title, meta, link, script, body, div} = stir

style = stir.createFactory 'style'

logoUrl = 'http://logo.cirru.org/cirru-32x32.png'

module.exports = (env, path) ->
  config = settings.get(env)
  assets = resource.get(config)
  router = pathUtil.parseAddress path, routes
  store = schema.store.set 'router', router

  stir.render stir.doctype,
    html {},
      head {},
        title {}, 'Actions in Recorder docs'
        meta charset: 'utf-8'
        link rel: 'icon', href: logoUrl
        if assets.style?
          link rel: 'stylesheet', href: assets.style
        if assets.vendorStyle?
          link rel: 'stylesheet', href: assets.vendorStyle
        script src: assets.vendor, defer: true
        script src: assets.main, defer: true
        style {}, 'body * {box-sizing: border-box;}'
    body style: 'margin: 0;',
      div id: 'app',
        ReactDOM.renderToString Container(store: store)
