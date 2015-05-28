CAS Docker
==========

Notes
-----

CAS login page:
http://localhost:8090/cas/login

NED API:
http://localhost:8081


TODO
----
* Enable SSL with self-signed certificate. Reference private key on a HOST share @
  runtime.

* Update "Register for a New Account" link on login.jsp to point to appropriate 
  Akita instance.

  Tip/Hack: you can change this at runtime by editing registration link in login page.

    $ docker exec -it docker_nedcas_1 /bin/bash

    root@c2df6d770bb7# cd /usr/local/tomcat/webapps/cas/WEB-INF/view/jsp/plos
    root@c2df6d770bb7# vim login.jsp
