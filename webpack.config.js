const HtmlWebpackPlugin = require('html-webpack-plugin')
const webpack = require('webpack')

module.exports = {
	devtool: 'source-map',
	entry: './app/entry',
	output: {
		path: 'dist',
		filename: 'dist.js'
	},
	module: {
		loaders: [
			{
				test: /\.js$/,
				loader: 'babel',
				query: {
					cacheDirectory: true
				},
				exclude: /node_modules/
			},
			{
				test: /\.css$/,
				loader: 'style!css'
			}
		]
	},
	plugins: [
		new HtmlWebpackPlugin({title: 'Scalar Set Theory'}),
		new webpack.DefinePlugin({
			'process.env': {NODE_ENV: JSON.stringify('production')}
		})
	]
}