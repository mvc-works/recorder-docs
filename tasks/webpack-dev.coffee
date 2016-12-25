
fs = require('fs')
path = require('path')
webpack = require('webpack')
settings = require('./settings')

module.exports = (info) ->
  config = settings.get('dev')
  # returns
  entry:
    vendor: [
      "webpack-dev-server/client?#{config.host}:#{config.port}"
      'webpack/hot/dev-server'
    ]
    main: [ 'webpack-hud', './src/main' ]
  output:
    path: path.join(info.__dirname, 'build/')
    filename: '[name].js'
    publicPath: "#{config.host}:#{config.port}/"
  resolve:
    extensions: ['.js', '.coffee']
  performance:
    hints: false
  module:
    rules: [
      {test: /\.coffee$/, loaders: ['coffee-loader', 'coffeelint-loader'], exclude: /node_modules/}
      {test: /\.md$/, loader: 'raw-loader'}
      {test: /.(png|jpg|gif|woff|woff2|eot|ttf|svg)(\?.+)?$/, loader: 'url-loader', query: limit: 100}
      {test: /\.css$/, loaders: ['style-loader', 'css-loader', 'postcss-loader']}
      {test: /\.json$/, loader: 'json-loader'}
    ]
  plugins: [
    new webpack.LoaderOptionsPlugin
      options:
        coffeelint:
          emitErrors: true
    new webpack.optimize.CommonsChunkPlugin({name: 'vendor', filename: 'vendor.js'})
    new webpack.HotModuleReplacementPlugin
  ]
