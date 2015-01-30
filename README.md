# docker-jssimport
Docker container for using the JSSImport script

This is intended to be used as part of the [Sal + WHD](https://registry.hub.docker.com/u/macadmins/salwhd/) + JSSImport triangle, but it can be used completely separate of Sal.

This container is not intended to be a daemonized running container.  It executes the [JSSImport](https://github.com/nmcspadden/JSSImport) script and then stops, so using --rm for each execution is ideal.

To use:
-----

Start a data-only database container:  
`docker run --name "jssi-db-data" -d --entrypoint /bin/echo macadmins/postgres Data-only container for jssimport-db`  
Start the database to hold it, change variables as necessary:  
`docker run --name "jssimport-db" -d --volumes-from jssi-db-data -e DB_NAME=jssimport -e DB_USER=jssdbadmin -e DB_PASS=password --restart="always" macadmins/postgres`  

Run the container, which will execute the JSSPull script and then delete itself:  
`docker run --rm --name jssi --link jssimport-db:db -e DB_NAME=jssimport -e DB_USER=jssdbadmin -e DB_PASS=password -e JSS_USER=user -e JSS_PASS=password -e JSS_URL=https://casper.domain.com:8443 macadmins/jssimport`  

The jssimport-db database container is now populated with the mobile device list from the provided JSS, and can be linked to a [WebHelpDesk container](https://registry.hub.docker.com/u/macadmins/whd/) for inventory aggregation.

# To Do
  1.  Link to existing JSS container
