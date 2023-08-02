# Need to run these commands when the container starts

# This command works around an openssl issue with ubuntu
touch /tmp/openssl.conf
export OPENSSL_CONF="tmp/openssl.conf"

# Works around an issue with Gulp
cp npm-shrinkwrap.json.tmp npm-shrinkwrap.json
npm install

# starts gulp
gulp