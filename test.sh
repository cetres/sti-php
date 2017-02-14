#!/bin/sh
docker build -t php-sql-oci_sti ./
s2i build test/test-app/ php-sql-oci_sti sample-app
docker run -p 8080:8080 sample-app 
