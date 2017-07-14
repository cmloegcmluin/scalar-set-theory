let assert = require('assert')

const expectTable = function (expectationsTable) {
	let rowIndex = 1
	let colIndex

	expectationsTable.forEach(function (expectationsRow, expectationsRowIndex) {
		colIndex = 1
		expectationsRow.forEach(function (expectationsCell, expectationsCellIndex) {
			expectationsCell = expectationsCell.trim()
			if (expectationsCell === '^^') {
				return
			}
			else if (expectationsCell === '') {
				colIndex++
				return
			}

			const cellType = rowIndex === 1 ? 'th' : 'td'

			const expectedRowSpan = calculateExpectedRowSpan(expectationsTable, expectationsRowIndex, expectationsCellIndex)
			if (expectedRowSpan > 1) {
				const actualRowSpan = browser.getAttribute(`//table/tr[${rowIndex}]/${cellType}[${colIndex}]`, 'rowspan')
				assert.equal(
					actualRowSpan,
					expectedRowSpan,
					`Failure at row ${expectationsRowIndex + 1}, col ${expectationsCellIndex + 1} of expectations table: expected cell to span ${expectedRowSpan} rows, but it actually spanned ${actualRowSpan}`
				)
			}

			const actualCell = browser.getText(`//table/tr[${rowIndex}]/${cellType}[${colIndex}]`)
			assert.equal(
				actualCell,
				expectationsCell,
				`Failure at row ${expectationsRowIndex + 1}, col ${expectationsCellIndex + 1} of expectations table: expected ${actualCell} to be ${expectationsCell}`
			)

			colIndex++
		})

		rowIndex++
	})
}

const calculateExpectedRowSpan = function(expectationsTable, row, col) {
	let span = 1
	row++
	while (expectationsTable[row] && expectationsTable[row][col] === '^^') {
		span++
		row++
	}
	return span
}

module.exports = expectTable