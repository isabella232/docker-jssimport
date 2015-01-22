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
RUN apt-get install -y git
RUN apt-get install -y python-setuptools
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN easy_install pip

RUN pip install python-jss
RUN pip install psycopg2

RUN git clone https://github.com/nmcspadden/JSSImport $APP_DIR

ADD run.sh /run.sh

CMD ["/run.sh"]
