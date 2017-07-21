const assert = require('assert')
const classSelector = require('./helpers/classSelector')

beforeEach('visit main page', function () {
	browser.url('/src/ScalarSetTheory/Main.elm')
})

describe('landing page', function () {
	it('shows the title and a table with defaults', function () {
		assert.equal(browser.getText('h1'), 'Scalar Set Theory')

		let sstTableSelect = classSelector('sstTable')
		let sstTableResult = browser.elements(sstTableSelect)
		assert.equal(sstTableResult.value.length, 1)
		let sstTable = sstTableResult.value[0]

		assert.equal(sstTable.getText('//div[1]/div[1]'), 'section')
		assert.equal(sstTable.getText('//div[1]/div[2]/div[1]/div[1]'), 'ed')
		assert.equal(sstTable.getText('//div[1]/div[2]/div[1]/div[2]/div[1]/div[1]'), 'nChord')

		assert.equal(sstTable.getText('//div[2]/div[1]'), 'min')
		assert.equal(sstTable.getValue('//div[2]/div[2]/div[1]/div[1]/select'), '3')
		assert.equal(sstTable.getValue('//div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/select'), '2')

		assert.equal(sstTable.getText('//div[3]/div[1]'), 'max')
		assert.equal(sstTable.getValue('//div[3]/div[2]/div[1]/div[1]/select'), '3')
		assert.equal(sstTable.getValue('//div[3]/div[2]/div[1]/div[2]/div[1]/div[1]/select'), '100')

		assert.equal(sstTable.getText('//div[4]/div[1]'), 'count(1)')
		assert.equal(sstTable.getText('//div[4]/div[2]/div[1]/div[1]'), '3')
		assert.equal(sstTable.getText('//div[4]/div[2]/div[1]/div[2]/div[1]/div[1]'), '2')
		assert.equal(sstTable.getText('//div[4]/div[2]/div[1]/div[2]/div[2]/div[1]'), '3')
	})
})

// describe('range of equal divisions', function () {
// 	it('updates the rows and count of rows when min or max filter is changed', function () {
// 		let edMinSelect = '//table/tr[2]/td[2]/select'
// 		let edMaxSelect = '//table/tr[3]/td[2]/select'
//
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '3')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (1)', '3 ' ]
// 		])
//
// 		selectOption(edMaxSelect, '7')
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '4 ' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '5 ' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '6 ' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '7 ' ],
// 		])
//
// 		selectOption(edMinSelect, '5')
// 		assert.equal(browser.getValue(edMinSelect), '5')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (3)', '5 ' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '6 ' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '^^' ],
// 			[ '^^       ', '7 ' ],
// 		])
// 	})
// })
//
// describe('range of nChords', function () {
// 	let edMinSelect, edMaxSelect, nChordMinSelect, nChordMaxSelect
// 	beforeEach(function() {
// 		edMinSelect = '//table/tr[2]/td[2]/select'
// 		edMaxSelect = '//table/tr[3]/td[2]/select'
//
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '3')
//
// 		nChordMinSelect = '//table/tr[2]/td[3]/select'
// 		nChordMaxSelect = '//table/tr[3]/td[3]/select'
//
// 		assert.equal(browser.getValue(nChordMinSelect), '2')
// 		assert.equal(browser.getValue(nChordMaxSelect), '100')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (1)', '3 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 		])
//
// 		selectOption(edMaxSelect, '7')
// 	})
//
// 	it('defaults to containing the range of eds, starting before or equal to them and ending after to equal to them', () => {
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '4 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '5 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '6 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '^^', '6     ' ],
// 			[ '^^       ', '7 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '^^', '6     ' ],
// 			[ '^^       ', '^^', '7     ' ],
// 		])
// 	})
//
// 	it('can be set to start inside the ed range (and still end after it)', function () {
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		selectOption(nChordMinSelect, '5')
// 		assert.equal(browser.getValue(nChordMinSelect), '5')
// 		assert.equal(browser.getValue(nChordMaxSelect), '100')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ' ],
// 			[ '^^       ', '4 ' ],
// 			[ '^^       ', '5 ', '5     ' ],
// 			[ '^^       ', '6 ', '5     ' ],
// 			[ '^^       ', '^^', '6     ' ],
// 			[ '^^       ', '7 ', '5     ' ],
// 			[ '^^       ', '^^', '6     ' ],
// 			[ '^^       ', '^^', '7     ' ],
// 		])
// 	})
//
// 	it('can be set to end inside the ed range (and still start before it)', function () {
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		selectOption(nChordMaxSelect, '5')
// 		assert.equal(browser.getValue(nChordMinSelect), '2')
// 		assert.equal(browser.getValue(nChordMaxSelect), '5')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '4 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '5 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '6 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '7 ', '2     ' ],
// 			[ '^^       ', '^^', '3     ' ],
// 			[ '^^       ', '^^', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 		])
// 	})
//
// 	it('can be set to be contained by the ed range, starting after it and ending before it', function () {
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		selectOption(nChordMinSelect, '4')
// 		selectOption(nChordMaxSelect, '5')
// 		assert.equal(browser.getValue(nChordMinSelect), '4')
// 		assert.equal(browser.getValue(nChordMaxSelect), '5')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ' ],
// 			[ '^^       ', '4 ', '4     ' ],
// 			[ '^^       ', '5 ', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '6 ', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 			[ '^^       ', '7 ', '4     ' ],
// 			[ '^^       ', '^^', '5     ' ],
// 		])
// 	})
//
// 	it('can be set to start and end before the ed range even starts', function () {
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		selectOption(nChordMaxSelect, '2')
// 		assert.equal(browser.getValue(nChordMinSelect), '2')
// 		assert.equal(browser.getValue(nChordMaxSelect), '2')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ' ],
// 			[ '^^       ', '4 ' ],
// 			[ '^^       ', '5 ' ],
// 			[ '^^       ', '6 ' ],
// 			[ '^^       ', '7 ' ],
// 		])
// 	})
//
// 	it('can be set to not even start until after the ed range has ended', function () {
// 		assert.equal(browser.getValue(edMinSelect), '3')
// 		assert.equal(browser.getValue(edMaxSelect), '7')
//
// 		selectOption(nChordMinSelect, '9')
// 		assert.equal(browser.getValue(nChordMinSelect), '9')
// 		assert.equal(browser.getValue(nChordMaxSelect), '100')
//
// 		expectTable([
// 			[ 'section  ', 'ed', 'nChord' ],
// 			[ 'min      ', ],
// 			[ 'max      ', ],
// 			[ 'count (5)', '3 ' ],
// 			[ '^^       ', '4 ' ],
// 			[ '^^       ', '5 ' ],
// 			[ '^^       ', '6 ' ],
// 			[ '^^       ', '7 ' ],
// 		])
// 	})
// })

// const selectOption = function (selectXPath, option) {
// 	browser.click(selectXPath + "/option[contains(.,\"" + option + "\")]")
// 	browser.execute(function (selectXPath) {
// 		const select = document.evaluate(
// 			selectXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null
// 		).singleNodeValue
// 		const event = new Event('input')
// 		select.dispatchEvent(event)
// 	}, selectXPath)
// }