module.exports = {
  entry: './index.js',
  output: {
    filename: 'dist.js'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        query: {
          cacheDirectory: true,
        },
        exclude: /node_modules/
      }
    ]
  }
}
