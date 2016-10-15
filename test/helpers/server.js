import crossPlatformSpawn from './crossPlatformSpawn'
import process from 'process'

export default class {
	async start() {
		this.process = crossPlatformSpawn(
			'npm', ['start', '--', '--port=8081'], {detached: true}
		)
		await new Promise((resolve, reject) => {
			this.process.once('close', () => {
				reject('Server did not start')
			})
			this.process.stdout.on('data', data => {
				if (data.includes('webpack: bundle is now VALID.')) {
					setTimeout(resolve, 1000)
				}
			})
		})
	}

	async stop() {
		process.kill(-this.process.pid, 'SIGKILL')
		await new Promise(resolve => {
			if (!this.process.connected) resolve()
			this.process.on('close', resolve)
		})
		if(process.platform === 'win32') {
			this.killProcess = crossPlatformSpawn(
				'npm', ['run-script', 'kill-test-server']
			)
			await new Promise(resolve => {
				this.killProcess.stdout.on('data', data => {
					if (data.includes('SUCCESS')) {
						setTimeout(
							resolve(
								'Server successfully killed. Windows sucks'
							),
							1000
						)
					}
				})
			})
		}
	}
}