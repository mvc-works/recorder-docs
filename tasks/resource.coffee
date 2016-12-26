
exports.get = (config) ->
  switch config.env
    when 'dev'
      vendor: "#{config.host}:#{config.port}/vendor.js"
      main: "#{config.host}:#{config.port}/main.js"
      style: null
      vendorStyle: null
    when 'build'
      assets = require('../build/assets')
      # returns
      main: assets.main[0]
      vendor: assets.vendor[0]
      style: assets.main[1]
      vendorStyle: assets.vendor[1]
