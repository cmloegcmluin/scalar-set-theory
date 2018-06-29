'use strict'

const assert = require('assert')
const classSelector = require('./classSelector')

const expectTable = function (expectationsTable) {
	const phoropter = browser.element(classSelector('phoropter'))

	expectationsTable.forEach(function (expectationsRow, expectationsRowIndex) {
		expectationsRow.forEach(function (expectationsCell, expectationsColIndex) {
			expectationsCell = expectationsCell.trim()
			if (expectationsCell === '--') return

			let actualCell
			try {
				actualCell = phoropter.getText(
					tableNodePathForExpectationsTableCoordinate(
						expectationsRowIndex, expectationsColIndex, expectationsTable,
					),
				)
			}
			catch (e) {

			}
			assert.equal(
				actualCell,
				expectationsCell,
				`Failure at row ${expectationsRowIndex + 1}, col ${expectationsColIndex + 1} of expectations table: expected ${actualCell} to be ${expectationsCell}`,
			)
		})
	})
}

const INDEX_OF_CELL_ITSELF = 1
const INDEX_OF_CELL_CHILDREN = 2

const tableNodePathForExpectationsTableCoordinate = function (expectationsRow, expectationsCol, expectationsTable) {
	let currentlySearchingTableNodeRow = 0
	let currentlySearchingTableNodeCol = 0

	let lastGoodRow = 0

	let path = '/'

	let tableNodeChildrenIndex
	let currentContents

	while (currentlySearchingTableNodeCol <= expectationsCol) {
		tableNodeChildrenIndex = 0
		while (currentlySearchingTableNodeRow <= expectationsRow) {
			currentContents = expectationsTable[ currentlySearchingTableNodeRow ][ currentlySearchingTableNodeCol ].trim()
			if (currentContents !== '--') {
				lastGoodRow = currentlySearchingTableNodeRow
				tableNodeChildrenIndex++
			}

			currentlySearchingTableNodeRow++
		}

		currentlySearchingTableNodeRow = lastGoodRow

		let cellItselfOrChildren
		if (currentlySearchingTableNodeCol < expectationsCol) {
			cellItselfOrChildren = INDEX_OF_CELL_CHILDREN
		}
		else if (currentlySearchingTableNodeCol === expectationsCol) {
			cellItselfOrChildren = INDEX_OF_CELL_ITSELF
		}
		path += `/div[${tableNodeChildrenIndex}]/div[${cellItselfOrChildren}]`

		currentlySearchingTableNodeCol++
	}

	return path
}

module.exports = expectTable
