'use strict'

const assert = require('assert')
const expectTable = require('./helpers/expectTable')
const selectOption = require('./helpers/selectOption')

const minRow = '/div[2]'
const maxRow = '/div[3]'
const overOne = '/div[2]/div[1]'
const select = '/div[1]/select'

const equalDivisionMinSelect = `/${minRow}${overOne.repeat(3)}${select}`
const equalDivisionMaxSelect = `/${maxRow}${overOne.repeat(3)}${select}`
const nChordMinSelect = `/${minRow}${overOne.repeat(6)}${select}`
const nChordMaxSelect = `/${maxRow}${overOne.repeat(6)}${select}`

beforeEach('visit main page', async () => {
	await browser.url('/dist/index.html')
})

describe('landing page', () => {
	it('shows the title and a phoropter', async () => {
		assert.equal(await $('h1').getText('h1'), 'Scalar Set Theory')
		assert.equal(!!await $('.phoropter').elementId, true)
	})
})

describe('range of equal divisions', () => {
	it('updates the rows and count of rows when min or max filter is changed', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '3')

		await expectTable([
			[ 'lens', ' ', ' ', 'equal division', '', '', 'n-chord' ],
			[ 'min ', ' ', ' ' ],
			[ 'max ', ' ', ' ' ],
			[ 'root', '^', '1', '3             ' ],
		])

		await selectOption(equalDivisionMaxSelect, '7')
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '', '', 'n-chord' ],
			[ 'min ', '  ', '  ' ],
			[ 'max ', '  ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '4             ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '5             ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '6             ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '7             ' ],
		])

		await selectOption(equalDivisionMinSelect, '5')
		assert.equal(await $(equalDivisionMinSelect).getValue(), '5')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '', '','n-chord' ],
			[ 'min ', '  ', '  ' ],
			[ 'max ', '  ', '  ' ],
			[ 'root', '^ ', '3 ', '5             ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '6             ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '--            ' ],
			[ '--  ', '--', '--', '7             ' ],
		])
	})
})

describe('range of nChords', () => {
	beforeEach(async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '3')

		assert.equal(await $(nChordMinSelect).getValue(), '2')
		assert.equal(await $(nChordMaxSelect).getValue(), '100')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ' ],
			[ 'max ' ],
			[ 'root', '^ ', '1 ', '3             ', '^ ', '2 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
		])

		await selectOption(equalDivisionMaxSelect, '7')
	})

	it('defaults to containing the range of eds, starting before or equal to them and ending after to equal to them', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		assert.equal(true, true)
		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ', '  ', '  ' ],
			[ 'max ', '  ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ', '^ ', '2 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '4             ', '^ ', '3 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '5             ', '^ ', '4 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '6             ', '^ ', '5 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '6      ' ],
			[ '--  ', '--', '--', '7             ', '^ ', '6 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '6      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '7      ' ],
		])
	})

	it('can be set to start inside the ed range (and still end after it)', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await selectOption(nChordMinSelect, '5')
		assert.equal(await $(nChordMinSelect).getValue(), '5')
		assert.equal(await $(nChordMaxSelect).getValue(), '100')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ', '  ' ],
			[ 'max ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '4             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '5             ', '^ ', '1 ', '5      ' ],
			[ '--  ', '--', '--', '6             ', '^ ', '2 ', '5      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '6      ' ],
			[ '--  ', '--', '--', '7             ', '^ ', '3 ', '5      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '6      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '7      ' ],
		])
	})

	it('can be set to end inside the ed range (and still start before it)', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await selectOption(nChordMaxSelect, '5')
		assert.equal(await $(nChordMinSelect).getValue(), '2')
		assert.equal(await $(nChordMaxSelect).getValue(), '5')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ', '  ' ],
			[ 'max ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ', '^ ', '2 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '4             ', '^ ', '3 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '5             ', '^ ', '4 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '6             ', '^ ', '4 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '7             ', '^ ', '4 ', '2      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '3      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
		])
	})

	it('can be set to be contained by the ed range, starting after it and ending before it', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await selectOption(nChordMinSelect, '4')
		await selectOption(nChordMaxSelect, '5')
		assert.equal(await $(nChordMinSelect).getValue(), '4')
		assert.equal(await $(nChordMaxSelect).getValue(), '5')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ', '  ' ],
			[ 'max ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '4             ', '^ ', '1 ', '4      ' ],
			[ '--  ', '--', '--', '5             ', '^ ', '2 ', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '6             ', '^ ', '2 ', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
			[ '--  ', '--', '--', '7             ', '^ ', '2 ', '4      ' ],
			[ '--  ', '--', '--', '--            ', '--', '--', '5      ' ],
		])
	})

	it('can be set to start and end before the ed range even starts', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await selectOption(nChordMaxSelect, '2')
		assert.equal(await $(nChordMinSelect).getValue(), '2')
		assert.equal(await $(nChordMaxSelect).getValue(), '2')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ', '  ' ],
			[ 'max ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ', '^ ', '1 ', '2      ' ],
			[ '--  ', '--', '--', '4             ', '^ ', '1 ', '2      ' ],
			[ '--  ', '--', '--', '5             ', '^ ', '1 ', '2      ' ],
			[ '--  ', '--', '--', '6             ', '^ ', '1 ', '2      ' ],
			[ '--  ', '--', '--', '7             ', '^ ', '1 ', '2      ' ],
		])
	})

	it('can be set to not even start until after the ed range has ended', async () => {
		assert.equal(await $(equalDivisionMinSelect).getValue(), '3')
		assert.equal(await $(equalDivisionMaxSelect).getValue(), '7')

		await selectOption(nChordMinSelect, '9')
		assert.equal(await $(nChordMinSelect).getValue(), '9')
		assert.equal(await $(nChordMaxSelect).getValue(), '100')

		await expectTable([
			[ 'lens', '  ', '  ', 'equal division', '  ', '  ', 'n-chord' ],
			[ 'min ', '  ' ],
			[ 'max ', '  ' ],
			[ 'root', '^ ', '5 ', '3             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '4             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '5             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '6             ', '^ ', '0 ' ],
			[ '--  ', '--', '--', '7             ', '^ ', '0 ' ],
		])
	})
})
