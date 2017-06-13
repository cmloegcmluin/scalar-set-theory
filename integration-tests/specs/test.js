let assert = require('assert');

describe('landing page', function () {
	it('shows the title and a table', function () {
		browser.url('/src/ScalarSetTheory/Main.elm');
		assert.equal(browser.getText('h1'), 'Scalar Set Theory');

		assert.equal(browser.getText('//table/tr[1]/th[1]'), 'section');
		assert.equal(browser.getText('//table/tr[1]/th[2]'), 'ed');
		assert.equal(browser.getText('//table/tr[2]/td[1]'), 'min');
		assert.equal(browser.getText('//table/tr[3]/td[1]'), 'max');
	});
});

describe('range of equal divisions', function () {
	it('updates the rows and count of rows when min filter is changed', function () {
		let minSelect = '//table/tr[2]/td[2]/select'
		let maxSelect = '//table/tr[3]/td[2]/select'
		browser.url('/src/ScalarSetTheory/Main.elm');

		assert.equal(browser.getValue(minSelect), '5');
		assert.equal(browser.getValue(maxSelect), '7');
		assert.equal(browser.getText('//table/tr[4]/td[1]'), 'count (3)');
		assert.equal(browser.getText('//table/tr[4]/td[2]'), '5');
		assert.equal(browser.getText('//table/tr[5]/td[1]'), '6');
		assert.equal(browser.getText('//table/tr[6]/td[1]'), '7');

		selectOption(minSelect, '7')

		assert.equal(browser.getValue(minSelect), '7');
		assert.equal(browser.getValue(maxSelect), '7');
		assert.equal(browser.getText('//table/tr[4]/td[1]'), 'count (1)');
		assert.equal(browser.getText('//table/tr[4]/td[2]'), '7');
	})
})

const selectOption = function (selectXPath, option) {
	browser.click(selectXPath + "/option[contains(.,\"" + option + "\")]");
	browser.execute(function(selectXPath) {
		const select = document.evaluate(selectXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
		const event = new Event('input');
		select.dispatchEvent(event);
	}, selectXPath);
}