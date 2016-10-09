import {spawn} from 'child_process';

export default function(cmd, args, options) {
	if(process.platform === 'win32') {
		return spawn('cmd.exe', ['/c', cmd, ...args], options)
	}
	return spawn(cmd, args, options)
}