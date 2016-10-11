import test from 'ava'
import PhantomJS from 'phantomjs-adapter'
import Server from './helpers/server'

const server = new Server()
const browser = new PhantomJS()

test.before(async () => {
  await server.start()
  await browser.open('http://127.0.0.1:8080')
});

test(async (t) => {
  const scalarCountInput = await browser.find('#scalar-count-input')
  t.not(scalarCountInput, null)
  t.is(scalarCountInput.value, "3")
});

test.after.always(async () => {
  await browser.exit()
  await server.stop()
});