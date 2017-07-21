`make integration` does not yet work on Windows.

You will need to open three shells. 

```
elm-reactor -p 8001
```

```
cd integration-tests
./node_modules/.bin/selenium-standalone start
```

```
cd integration-tests
./node_modules/.bin/wdio wdio.config.js
```

And try to avoid zombie selenium servers because it is harder to kill things by port they run on.

By the way, the magic incantation to get `npm i` to work at all was:

```
npm config set msvs_version 2017
```

I also had to comment out some lines of `wdio.config.js` related to the loopback host.
I was overriding its working defaults for some reason.
