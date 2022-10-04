'use strict'

const selectOption = async (selectXPath, option) => {
	await $(selectXPath).selectByVisibleText(option)
	browser.execute(selectXPath => {
		const select = document.evaluate(
			selectXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null
		).singleNodeValue
		const event = new Event('input')
		select.dispatchEvent(event)
	}, selectXPath)
}

module.exports = selectOption
