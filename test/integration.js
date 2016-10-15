import test from 'ava'
const webdriverio = require('webdriverio')
import Server from './helpers/server'

const server = new Server()
let client, scalarInputs, inputValue, normalOrderCount

test.beforeEach(async () => {
	await server.start()
	const options = {
		desiredCapabilities: {browserName: 'chrome'}
	}
	client = webdriverio.remote(options).init().url('localhost:8081')
})

test.afterEach.always(async () => {
	await server.stop()
	await client.end()
})

test('integration - initial values', async t => {
	t.is(await client.getTitle(), 'Scalar Set Theory')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 3)
	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '1')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '2')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '1')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.*\n3.*/.test(normalOrderCount))
})

test('integration - reducing scalar count and adding new values', async t => {
	await client.setValue('#scalar-count-input', '2')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 2)
	await client.setValue('.scalar-input-0', '20')
	await client.setValue('.scalar-input-1', '20')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.*\n3446167860.*/.test(normalOrderCount))
})

test('integration - adding new scalars', async t => {
	await client.setValue('#scalar-count-input', '5')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 5)

	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '1')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '2')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '1')
	inputValue = await client.getValue('.scalar-input-3')
	t.is(inputValue, '')
	inputValue = await client.getValue('.scalar-input-4')
	t.is(inputValue, '')
})

test('integration - skipped scalars are treated as zeroes', async t => {
	await client.setValue('#scalar-count-input', '5')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 5)

	await client.setValue('.scalar-input-4', '3')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.*\n60.*/.test(normalOrderCount))
})

test('integration - scalars preserved when clearing the count', async t=> {
	await client.setValue('#scalar-count-input', '')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 3)
	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '1')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '2')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '1')

	await client.setValue('#scalar-count-input', '4')
	scalarInputs = await client.elements('.scalar-input')
	t.is(scalarInputs.value.length, 4)
	inputValue = await client.getValue('.scalar-input-0')
	t.is(inputValue, '1')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '2')
	inputValue = await client.getValue('.scalar-input-2')
	t.is(inputValue, '1')
})

test('integration - cleared scalars are treated as zeroes', async t => {
	await client.setValue('.scalar-input-1', '0')
	inputValue = await client.getValue('.scalar-input-1')
	t.is(inputValue, '')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.*\n1.*/.test(normalOrderCount))
})


test('integration - if all scalars zero, normal order count zero', async t => {
	await client.setValue('.scalar-input-0', '0')
	await client.setValue('.scalar-input-1', '0')
	await client.setValue('.scalar-input-2', '0')
	normalOrderCount = await client.getText('#normal-order-count')
	t.true(/.*\n0.*/.test(normalOrderCount))
})