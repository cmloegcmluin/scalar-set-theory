'use strict'

const classSelector = function (className) {
	return `//div[contains(concat(' ', @class, ' '), ' ${className} ')]`
}

module.exports = classSelector