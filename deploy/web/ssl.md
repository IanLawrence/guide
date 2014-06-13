# SSL Certificates

For deployment, the most important thing that you need is a SSL certificate. You can either purchase a SSL certificate or generate your own.

At the end of this process, you should have:

* Certificate file. This is the Public Certificate. Usually named **.crt**
* Certificate key. This is the Private Key. Don't share it with anyone. Usually named **.key** or **.pem**

## Generating your own

The easiest and smallest set of commands to generate your own certificate are as follows:

```
$ openssl genrsa -des3 -passout pass:x -out certificate.pass.key 2048
$ openssl rsa -passin pass:x -in certificate.pass.key -out certificate.key
$ openssl req -new -key certificate.key -out certificate.csr
    Country Name: e.g. UG
    State or Province Name: e.g. Kampala
    Locality Name: e.g. Kampala
    Organization Name: e.g. UNICEF
    Organizational Unit Name: e.g. Child Protection
    Common Name: e.g. localhost, dev.rapidftr.com, etc
    Email Address: e.g. rapidftr@googlegroups.com
    A challenge password []:
    An optional company name []:
$ openssl x509 -req -days 3650 -in certificate.csr -signkey certificate.key -out certificate.crt
```

The generated **certificate.crt** and **certificate.key** is what you need.
