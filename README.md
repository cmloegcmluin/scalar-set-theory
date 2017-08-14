# INTEGRATION TEST ODYSSEY

`make integration` does not yet work on Windows.

The main problem was that I was unable to successfully run the `npm i` command in the `integration-tests` directory. It was failing on the apparently infamous `node-gyp` issue. Even though I had the latest versions of `npm` and `node`, and wasn't supposed to need to "build" "fibers" or whatever, on Windows 10 something was up. I followed all the instructions online, but nothing was working.

What finally worked for me was re-installing Microsoft Visual Studio from scratch, with everything and the kitchen sink included, in particular several Windows SDKs. Then I needed to run this magic incantation: `npm config set msvs_version 2017`. 

For what it's worth, downgrading to node 6 fixed this issue for my coworker on a Mac.

I also had to comment out some lines of `wdio.config.js` related to the loopback host. I was overriding its working defaults for some reason. Hopefully that doesn't screw up it working on Mac OS.

Also, because the `make integration` script was not written to be cross-platform (`lsof` is Unix only) you will need to open three separate shells: 

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

And try to avoid zombie selenium servers because it is harder to kill things by port they run on and it isn't being done automatically.

# UNIT TEST ODYSSEY

Then we had a whole separate odyssey just to get the unit tests to work. 

It was complaining that it was finding two copies of the `node-test-runner` package, one locally and one globally (on Windows, `~\AppData\Roaming\npm\`). So I would `npm uninstall -g elm-test` to solve that problem.

But then I wouldn't be able to run `elm-test` on the command line at all. So I tried the other way. I removed the `node-test-runner` package from my `elm-package.json` and uninstalled it, and re-installed the global `elm-test` CLI. Then I could run the command again, but then of course it seemed to be missing necessary `node-test-runner` specific material locally. I couldn't win.

So, I moved forward on the assumption that the global `elm-test` was the correct one, because it is the recommended instructions by the `elm-test` authors. I figured that there was just something different about my packages' interdependencies on Windows from how it worked out of the box on Mac OS. So I tried the whole `rm -rf elm-stuff/` trick in both `./` and './tests' to reset and start from scratch, but hit the same problem.

I eventually noticed that there was some filesystem-related shenanigans happening in one of these packages installation script that was breaking on my Git Bash shell (`elm-make: rtfeldman-elm-css-4c9c017: MoveFileEx "rtfeldman-elm-css-4c9c017" "rtfeldman\\elm-css\\9.1.0": permission denied (Access is denied.)`. So I tried running it instead from an elevated Admin privileged Command Prompt terminal. Made it past this issue. But still hit the same duped package problem.

Elm recommended that I try starting from scratch at the `elm-package.json` `dependencies` level, i.e. deleting all the registered dependencies from my config file, and running the start and test commands for my app over and over, one by one re-installing packages it snags on. Unfortunately toward the end of this process I would hit a new problem: `Error: I cannot find a set of packages that works with your constraints.` In doing this, I was getting all the latest versions of all the packages I had been using. Since the package ecosystem in Elm is still in quite a bit of flux, I wasn't surprised that this would break. 

At this point I was getting pretty desperate. I went forward on the assumption that the particular combination of dependencies that had been working with on my Mac workstation had to be fine, and it was something else wrong with my workstation. I re-installed Elm itself. Deleted all global npm packages and cache. Removed everything from my `$PATH`. Nothing was working.

What finally worked for me was deciding to use the local `elm-test` binary. I had been close before when I thought I was missing stuff locally; I just hadn't added it to my path: `~\workspace\scalar-set-theory\tests\elm-stuff\packages\rtfeldman\node-test-runner\3.0.0\bin`. 

I still wasn't done though. `elm-test` now threw the error `Cannot find module 'node-elm-compiler'`. Which wasn't an Elm package. Nor did `npm i` globally work. Nor did `npm i` locally work, even! This was coming from a `package.json` in my installed Elm package! So I just had to `cd tests/elm-stuff/packages/rtfeldman/node-test-runner/3.0.0/` and `npm i` there, then I could finally run `elm-test` and have things pass.

I added stuff to the `make setup` script that theoretically should automate this on new workstations like this Windows 10 one, but I'm too afraid to test it right now.

# DEPLOYMENT ODYSSEY

This one wasn't so bad. But the `cf` CLI would lock me out of my PWS account because the interactive login prompt is broken and it will repeatedly try creds it thinks are failing. The solution was to use the flags to the login script, `-u` and `-p`, rather than trying to go interactive.

I automated this, actually improving workflow, by automatically logging you in (in case the 24 timeout has passed) whenever you deploy. However, the one gotcha is that if your org or space on PWS have a space in them (mine do) then when you put those as environment variables they have to begin and end with escaped quotes; I couldn't include that in the bash script itself.
