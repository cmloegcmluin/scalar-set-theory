let assert = require('assert');

describe('Scalar Set Theory', function () {
	it('shows the title', function () {
		browser.url('/src/ScalarSetTheory/Main.elm');
		assert.ok(browser.getHTML('body').includes('Scalar Set Theory'));
	});
});