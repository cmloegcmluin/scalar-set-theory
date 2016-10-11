NODE_ENV=production webpack -p
cf push scalar-set-theory -b https://github.com/cloudfoundry/staticfile-buildpack.git -m 64m