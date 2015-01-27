FROM ubuntu:14.04.1

MAINTAINER Nick McSpadden <nmcspadden@gmail.com>

ENV APP_DIR /home/jssi
ENV DB_HOST db
ENV DB_NAME jssimport
ENV DB_USER jssdbadmin
ENV DB_PASS password

ENV JSS_USER user
ENV JSS_PASS password
ENV JSS_URL https://casper:8443/

RUN apt-get update
RUN apt-get install -y python-setuptools
RUN apt-get install -y python-psycopg2
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN easy_install pip

RUN pip install python-jss

ADD https://github.com/nmcspadden/JSSImport/tarball/master $APP_DIR/master.tar.gz
RUN tar -zxvf /home/jssi/master.tar.gz && mv nmcspadden*/* $APP_DIR/ && rm -rf nmcspadden-JSSImport* && rm /home/jssi/master.tar.gz

ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]
