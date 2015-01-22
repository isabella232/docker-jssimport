#!/bin/bash

sed -i "s/db/$DB_HOST/" $APP_DIR/com.github.nmcspadden.prefs.json
sed -i "s/saldbadmin/$DB_USER/" $APP_DIR/com.github.nmcspadden.prefs.json
sed -i "s/sal/$DB_NAME/" $APP_DIR/com.github.nmcspadden.prefs.json
sed -i "s/password/$DB_PASS/" $APP_DIR/com.github.nmcspadden.prefs.json

sed -i "s/<string>user/<string>$JSS_USER/" -i $APP_DIR/com.github.sheagcraig.python-jss.plist
sed -i "s/<string>password/<string>$JSS_PASS/" -i $APP_DIR/com.github.sheagcraig.python-jss.plist
sed -i "s@<string>https://casper.domain.com:8443@<string>$(echo $JSS_URL)@" -i $APP_DIR/com.github.sheagcraig.python-jss.plist

python $APP_DIR/jsspull.py --dbprefs $APP_DIR/com.github.nmcspadden.prefs.json --jssprefs $APP_DIR/com.github.sheagcraig.python-jss.plist