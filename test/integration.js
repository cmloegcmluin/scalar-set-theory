import test from 'ava'
import Server from './helpers/server'

const server = new Server()
const webdriverio = require('webdriverio')
let client;

test(async t => {
	let scalarInputs, inputValue, normalOrderCount

	// start up

	await server.start()

	const options = {
		desiredCapabilities: {browserName: 'chrome'}
	}
	client = webdriverio.remote(options).init().url('localhost:8081')

	// page loads

	t.is(await client.getTitle(), 'Scalar Set Theory')

	// initial values

	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 3)
	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '1')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '2')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '1')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.* 3.*/.test(normalOrderCount))

	// can reduce scalar count and add new values

	await client.setValue('#scalar-count-input', '2')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 2)
	await client.setValue('.scalar-input-0', '20')
	await client.setValue('.scalar-input-1', '20')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.* 3446167860.*/.test(normalOrderCount))

	// can add new scalars

	await client.setValue('#scalar-count-input', '4')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 4)

	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '20')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '20')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '')
	inputValue = await client.getValue('.scalar-input-3')
	t.is(inputValue, '')

	//can skip an input in the middle and it will be treated as zero

	await client.setValue('.scalar-input-3', '3')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.* 39561953771340.*/.test(normalOrderCount))

	
	// can clear the count without losing scalars

	await client.setValue('#scalar-count-input', '')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 4)
	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '20')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '20')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '')
	inputValue = await client.getValue('.scalar-input-3')
	t.is(inputValue, '3')

	await client.setValue('#scalar-count-input', '4')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 4)
	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '20')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '20')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '')
	inputValue = await client.getValue('.scalar-input-3')
	t.is(inputValue, '3')

	// can clear another input in the middle and it will be treated as zero

	await client.setValue('.scalar-input-1', '0')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.* 77.*/.test(normalOrderCount))

	// if all scalars are zeroed out, returns zero
	
	await client.setValue('.scalar-input-0', '0')
	await client.setValue('.scalar-input-3', '0')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.* 0.*/.test(normalOrderCount))
})

test.after.always(async t => {
	await server.stop()
	client.end()
})