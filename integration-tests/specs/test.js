const assert = require('assert')
const classSelector = require('./helpers/classSelector')
const expectTable = require('./helpers/expectTable')
const selectOption = require('./helpers/selectOption')

const equalDivisionMinSelect = '//div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/select'
const equalDivisionMaxSelect = '//div[3]/div[2]/div[1]/div[2]/div[1]/div[1]/select'
const nChordMinSelect = '//div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/select'
const nChordMaxSelect = '//div[3]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/select'

beforeEach('visit main page', function () {
	browser.url('/src/ScalarSetTheory/Main.elm')
	browser.waitForExist('h1', 10000)
})

describe('landing page', function () {
	it('shows the title and a phoropter', function () {
		assert.equal(browser.getText('h1'), 'Scalar Set Theory')
		assert.equal(browser.elements(classSelector('phoropter')).value.length, 1)
	})
})

describe('range of equal divisions', function () {
	it('updates the rows and count of rows when min or max filter is changed', function () {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '3')

		expectTable([
			[ 'lens', ' ', 'equal division', '', 'n-chord' ],
			[ 'min ', ' ', ],
			[ 'max ', ' ', ],
			[ 'root', '1', '3             ' ]
		])

		selectOption(equalDivisionMaxSelect, '7')
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')
		
		expectTable([
			[ 'lens', '  ', 'equal division', '', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '4             ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '5             ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '6             ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '7             ' ],
		])
		
		selectOption(equalDivisionMinSelect, '5')
		assert.equal(browser.getValue(equalDivisionMinSelect), '5')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')
		
		expectTable([
			[ 'lens', '  ', 'equal division', '', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '3 ', '5             ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '6             ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '^^            ' ],
			[ '^^  ', '^^', '7             ' ],
		])
	})
})

describe('range of nChords', function () {
	beforeEach(function() {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '3')

		assert.equal(browser.getValue(nChordMinSelect), '2')
		assert.equal(browser.getValue(nChordMaxSelect), '100')

		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', ],
			[ 'max ', ],
			[ 'root', '1 ', '3             ', '2 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
		])

		selectOption(equalDivisionMaxSelect, '7')
	})

	it('defaults to containing the range of eds, starting before or equal to them and ending after to equal to them', () => {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')

		assert.equal(true, true)
		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ', '2 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '4             ', '3 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '5             ', '4 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '6             ', '5 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '6      ' ],
			[ '^^  ', '^^', '7             ', '6 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '6      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '7      ' ],
		])
	})

	it('can be set to start inside the ed range (and still end after it)', function () {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')

		selectOption(nChordMinSelect, '5')
		assert.equal(browser.getValue(nChordMinSelect), '5')
		assert.equal(browser.getValue(nChordMaxSelect), '100')

		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ', '0 ', ],
			[ '^^  ', '^^', '4             ', '0 ', ],
			[ '^^  ', '^^', '5             ', '1 ', '5      ' ],
			[ '^^  ', '^^', '6             ', '2 ', '5      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '6      ' ],
			[ '^^  ', '^^', '7             ', '3 ', '5      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '6      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '7      ' ],
		])
	})

	it('can be set to end inside the ed range (and still start before it)', function () {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')

		selectOption(nChordMaxSelect, '5')
		assert.equal(browser.getValue(nChordMinSelect), '2')
		assert.equal(browser.getValue(nChordMaxSelect), '5')

		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ', '2 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '4             ', '3 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '5             ', '4 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '6             ', '4 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '7             ', '4 ', '2      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '3      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
		])
	})

	it('can be set to be contained by the ed range, starting after it and ending before it', function () {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')

		selectOption(nChordMinSelect, '4')
		selectOption(nChordMaxSelect, '5')
		assert.equal(browser.getValue(nChordMinSelect), '4')
		assert.equal(browser.getValue(nChordMaxSelect), '5')

		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ', '0 ', ],
			[ '^^  ', '^^', '4             ', '1 ', '4      ' ],
			[ '^^  ', '^^', '5             ', '2 ', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '6             ', '2 ', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
			[ '^^  ', '^^', '7             ', '2 ', '4      ' ],
			[ '^^  ', '^^', '^^            ', '^^', '5      ' ],
		])
	})

	it('can be set to start and end before the ed range even starts', function () {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')

		selectOption(nChordMaxSelect, '2')
		assert.equal(browser.getValue(nChordMinSelect), '2')
		assert.equal(browser.getValue(nChordMaxSelect), '2')

		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ', '1 ', '2      ' ],
			[ '^^  ', '^^', '4             ', '1 ', '2      ' ],
			[ '^^  ', '^^', '5             ', '1 ', '2      ' ],
			[ '^^  ', '^^', '6             ', '1 ', '2      ' ],
			[ '^^  ', '^^', '7             ', '1 ', '2      ' ],
		])
	})

	it('can be set to not even start until after the ed range has ended', function () {
		assert.equal(browser.getValue(equalDivisionMinSelect), '3')
		assert.equal(browser.getValue(equalDivisionMaxSelect), '7')

		selectOption(nChordMinSelect, '9')
		assert.equal(browser.getValue(nChordMinSelect), '9')
		assert.equal(browser.getValue(nChordMaxSelect), '100')

		expectTable([
			[ 'lens', '  ', 'equal division', '  ', 'n-chord' ],
			[ 'min ', '  ', ],
			[ 'max ', '  ', ],
			[ 'root', '5 ', '3             ', '0 ' ],
			[ '^^  ', '^^', '4             ', '0 ' ],
			[ '^^  ', '^^', '5             ', '0 ' ],
			[ '^^  ', '^^', '6             ', '0 ' ],
			[ '^^  ', '^^', '7             ', '0 ' ],
		])
	})
})
