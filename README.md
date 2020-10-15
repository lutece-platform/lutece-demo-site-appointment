# lutece-demo-site-appointment
Lutece Demo site for the Appointment booking plugin.

## Features


## Workflow



## Run the latest image available on DockerHub

All Lutece images are available at https://hub.docker.com/u/lutece/

`docker run -p 80:8080 lutece/appointment`

## Connect to the server to see the service

http://localhost/appointment

## build yourself an image

`docker build -t site-forms-demo .`


## Launch a container with your image

`docker run -p 80:8080 site-forms-demo`

## Connect to the server to see the service

'http://localhost/appointment'


## Back office management

http://localhost/appointment/jsp/admin/AdminMenu.jsp

Connect to the back office with login/pwd : admin/appointment


## Plugins and modules used

   | Component                                | Version | Mandatory | Role |   
   |------------------------------------------|---------|-----------|------|
   | lutece-core                              |  6.2.1  |    Yes    | The Lutece Kernel       |  
   | plugin-workflow                          |  4.3.9  |    Yes    | The Workflow engine       |  
   | library-workflow-core                    |  1.2.2  |    Yes    | The Workflow engine     |
   | library-image                            |  1.0.3  |    Yes    |      |
   | library-blobstore                        |  1.0.0  |    Yes    |      |
   | library-httpaccess                       |  2.5.2  |    Yes    |      |
   | library-signrequest                      |  2.0.4  |    Yes    |      |
   | library-rbac-api                         |  1.0.0  |    Yes    | Permission management with Role Based Access Control     |
   | plugin-rest                              |  3.1.1  |    Yes    |      |
   | library-workgroup-api                    |  1.0.0  |    Yes    |      |
   | plugin-leaflet                           |  1.0.1  |    Yes    |      |
   | plugin-regularexpression                 |  3.0.4  |    Yes    |      |
   | plugin-captcha                           |  2.1.1  |    No     |      |
   | module-captcha-jcaptcha                  |  2.1.13 |    No     |      |
   | plugin-mylutece                          |  3.3.6  |    Yes    |      |
   | module-mylutece-database                 |  5.0.3  |    Yes    |      |
   | plugin-genericattributes                 |  2.1.0  |    Yes    |      |
   | module-genericattributes-googlemaps      |  2.0.0  |    Yes    |      |
   | plugin-resource                          |  1.0.0  |    Yes    |      |
   | module-resource-adminuser                |  1.0.0  |    Yes    |      |
   | module-resource-mylutece                 |  1.0.0  |    Yes    |      |
   | plugin-sitelabels                        |  1.1.2  |    Yes    |      |
   | plugin-asynchronousupload                |  1.1.1  |    Yes    |      |
   | plugin-html                              |  4.0.1  |    No     | Usefull to create some content in the site  |
   | plugin-solr                              |  3.1.2  |    Yes    |      |
   | plugin-solrserver                        |  3.0.0  |    Yes    |      |
   | plugin-appointment                       |  2.1.0  |    Yes    |  |
   | module-appointment-solrsearchapp         |  2.0.5  |    Yes    |      |
   | module-appointment-solr                  |  2.0.4  |    Yes    |      |
   | module-workflow-appointment              |  2.0.8  |    Yes    |      |
   | module-appointment-alert                 |  2.0.2  |    Yes    |      |
   | module-appointment-filling               |  2.0.3  |    Yes    |      |
   | module-appointment-leaflet               |  2.0.3  |    Yes    |      |
   | module-appointment-resource              |  2.0.5  |    Yes    |      |
   | plugin-mydashboard                       |  1.0.1  |    Yes    |      |
   | module-appointment-mydashboard           |  2.0.1  |    Yes    |      |
   | module-mydashboard-mylutecedatabase      |  1.0.0  |    Yes    |      |
   | plugin-address                           |  1.0.6  |    Yes    |      |
   | module-address-autocomplete              |  1.0.5  |    Yes    |      |


## Sources
All Lutece sources are available  at :
'https://github.com/lutece-platform'

More information about Lutece framework : https://lutece.paris.fr/

