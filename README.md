# docker-jssimport
Docker container for using the JSSImport script

To use:
-----

Start a data-only database container:  
`docker run --name "jssi-db-data" -d --entrypoint /bin/echo macadmins/postgres Data-only container for jssimport-db`  
Start the database to hold it, change variables as necessary:  
`docker run --name "jssimport-db" -d --volumes-from jssi-db-data -e DB_NAME=jssimport -e DB_USER=jssdbadmin -e DB_PASS=password --restart="always" macadmins/postgres`  

Run the container, which will execute the JSSPull script and then delete itself:  
`docker run --rm --name jssi --link jssimport-db:db -e DB_NAME=jssimport -e DB_USER=jssdbadmin -e DB_PASS=password -e JSS_USER=user -e JSS_PASS=password -e JSS_URL=https://casper.domain.com:8443 nmcspadden/jssimport`  

# To Do
  1.  Link to existing JSS container
