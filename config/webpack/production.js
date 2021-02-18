process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

// Add `.min` to the production versions of the output files.
// https://github.com/matestack/matestack-ui-core/issues/343#issuecomment-580246554
// https://github.com/matestack/matestack-ui-core/issues/343#issuecomment-581149092
//
environment.config.set("output.filename", chunkData => {
  return "[name].min.js"
})
const miniCssExtractPlugin = environment.plugins.get('MiniCssExtract')
miniCssExtractPlugin.options.filename = "[name].min.css"

// In order to have babel's es5 (ie11) transpiling be applied to all of the
// js code, it needs to be included in the loader paths.
// https://github.com/rails/webpacker/blob/master/docs/webpack.md
// https://github.com/matestack/matestack-ui-core/issues/238
//
const babelLoader = environment.loaders.get('babel')
delete babelLoader.exclude
const path = require('path')
const matestackUiBootstrapRootPath = path.resolve(__dirname, '../..')
babelLoader.include.push(path.resolve(matestackUiBootstrapRootPath, 'app/concepts/matestack/ui/bootstrap'))
babelLoader.include.push(path.resolve(matestackUiBootstrapRootPath, 'node_modules'))

// We also need to tell babel where to find matestack-ui-material if we are using `npm link`.
// Otherwise, it won't follow the symlink to `node_modules/matestack-ui-core`.
//
// const matestackUiCoreRootPath = path.resolve(require.resolve('matestack-ui-core'), '../../../')
// babelLoader.include.push(matestackUiCoreRootPath)

module.exports = environment.toWebpackConfig()
