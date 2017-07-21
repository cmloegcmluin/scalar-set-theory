const selectOption = function (selectXPath, option) {
	browser.click(selectXPath + "/option[contains(.,\"" + option + "\")]")
	browser.execute(function (selectXPath) {
		const select = document.evaluate(
			selectXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null
		).singleNodeValue
		const event = new Event('input')
		select.dispatchEvent(event)
	}, selectXPath)
}

module.exports = selectOption
