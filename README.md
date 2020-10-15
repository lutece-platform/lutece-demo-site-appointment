# lutece-demo-site-appointment
Lutece Demo site for the Appointment booking plugin.

## Features


## Workflow



## Run the latest stable image available on DockerHub

All Lutece images are available at https://hub.docker.com/u/lutece/

`docker run -p 80:8080 lutece/appointment`

## Run the latest development image available on DockerHub

All Lutece images are available at https://hub.docker.com/u/lutece/

`docker run -p 80:8080 lutece/appointment:develop`


## Connect to the server to see the service

http://localhost/appointment

## build yourself an image

`docker build -t site-appointment-demo .`


## Launch a container with your image

`docker run -p 80:8080 site-appointment-demo`

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
   | library-blobstore                        |  1.0.0  |    Yes    | Used for Object/BLOB storage     |
   | library-httpaccess                       |  2.5.2  |    Yes    | Used to call external Web Services     |
   | library-signrequest                      |  2.0.4  |    Yes    | Used to sign Web Service calls     |
   | library-rbac-api                         |  1.0.0  |    Yes    | Permission management with Role Based Access Control     |
   | plugin-rest                              |  3.1.1  |    Yes    | Used to expose RESTful Web Services     |
   | library-workgroup-api                    |  1.0.0  |    Yes    |      |
   | plugin-regularexpression                 |  3.0.4  |    Yes    | Utils for forms field validation    |
   | plugin-captcha                           |  2.1.1  |    No     | Securing the registration form with a captcha   |
   | module-captcha-jcaptcha                  |  2.1.13 |    No     | A captcha implementation     |
   | plugin-genericattributes                 |  1.3.4  |    Yes    | Used to create the registration form fields     |p  |
   | plugin-asynchronousupload                |  1.1.1  |    No     | Used for asynchronous upload of files in the registration form  |
   | plugin-html                              |  4.0.1  |    No     | Usefull to create some content in the site  |
   | plugin-appointment                       |  2.1.0  |    Yes    | The Appointment main application  |
   | module-workflow-appointment              |  2.0.8  |    Yes    |  Specific Workflow tasks for appointement management    |
   | module-appointment-alert                 |  2.0.2  |    Yes    |      |
   | module-appointment-filling               |  2.0.3  |    Yes    |      |
   | plugin-mydashboard                       |  1.0.1  |    Yes    |  A Front Office Dashboard for the user    |
   | module-appointment-mydashboard           |  2.0.1  |    Yes    |      |
   | module-mydashboard-mylutecedatabase      |  1.0.0  |    Yes    |      |
   | plugin-address                           |  1.0.6  |    Yes    |      |
   | module-address-autocomplete              |  1.0.5  |    Yes    |      |


## Sources
All Lutece sources are available  at :
'https://github.com/lutece-platform'

More information about Lutece framework : https://lutece.paris.fr/

