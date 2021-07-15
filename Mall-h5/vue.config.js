const path = require('path')

module.exports = {
  css: {
    sourceMap: true,
    loaderOptions: {
      sass: {
        additionalData: '@import "~@/assets/css/global.scss";'
      }
    }
  },
  chainWebpack: (config) => {
    config.resolve.alias.set('@', path.resolve(__dirname, 'src'))
  }
}
