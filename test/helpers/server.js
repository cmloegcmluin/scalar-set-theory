import crossPlatformSpawn from './crossPlatformSpawn'

export default class {
	async start() {
		this.process = crossPlatformSpawn('npm', ['start'])
		await new Promise((resolve, reject) => {
			this.process.once('close', () => {
				reject('Server did not start')
			});
			this.process.stdout.on('data', data => {
				if (data.includes('webpack: bundle is now VALID.')) {
					setTimeout(resolve, 1000)
				}
			})
		})
	}

	async stop() {
    this.process.kill()
		await new Promise(resolve => {
			if (!this.process.connected) resolve()
			this.process.on('close', resolve)
		})

    this.killProcess = crossPlatformSpawn('npm', ['run-script', 'kill-test-server'])
    await new Promise(resolve => {
      this.killProcess.stdout.on('data', data => {
        if (data.includes('SUCCESS')) {
          console.log('Server process successfully killed. Windows sucks')
          setTimeout(resolve, 1000)
        }
      })
    })
	}
}