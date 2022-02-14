const { environment } = require('@rails/webpacker')
const erb = require('./loaders/erb')

const webpack = require('webpack');

const customWebpackConfig = {
  resolve: {
    alias: {
      'vue': 'vue/dist/vue.esm-bundler'
    }
  },
  plugins: [
    new webpack.DefinePlugin({
      __VUE_OPTIONS_API__: true,
      __VUE_PROD_DEVTOOLS__: false
    })
  ]
}

environment.config.merge(customWebpackConfig)

environment.loaders.prepend('erb', erb)
module.exports = environment
