FROM debian

MAINTAINER Nick McSpadden <nmcspadden@gmail.com>

ENV APP_DIR /home/jssi
ENV DB_HOST db
ENV DB_NAME jssimport
ENV DB_USER jssdbadmin
ENV DB_PASS password

ENV JSS_USER user
ENV JSS_PASS password
ENV JSS_URL https://casper:8443/

RUN apt-get update && apt-get install -y python-setuptools python-psycopg2 && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://github.com/sheagcraig/python-jss/tarball/master /usr/local/python-jss/master.tar.gz
RUN tar -zxvf /usr/local/python-jss/master.tar.gz --strip-components=1 -C /usr/local/python-jss && rm /usr/local/python-jss/master.tar.gz
RUN python /usr/local/python-jss setup.py install

ADD https://github.com/nmcspadden/JSSImport/tarball/master $APP_DIR/master.tar.gz
RUN tar -zxvf /home/jssi/master.tar.gz --strip-components=1 -C /home/jssi/ && rm /home/jssi/master.tar.gz

ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]
