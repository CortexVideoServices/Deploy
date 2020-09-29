# Deployment tools
In this repository, you can find the Dockerfile and docker-compose files 
to help you deploy sample applications. It can also be a good example for 
your own application based on the Cortex Video Services.

### Before build images
Before building docker images, you need to pull the latest versions of 
the submodules. Just run command:

    git submodule update --remote

### Build docker images
You need to build docker images with docker-compose. Run the following 
command to create an image to run on localhost.

    docker-compose -f Docker/bases/docker-compose.yaml build
    docker-compose -f Docker/server/docker-compose.yaml build
    docker-compose -f Docker/videoroom/docker-compose.yaml build

In order for the build images to run on a real server, you need: the 
associated hostname, the associated SSL certificate and its private key, 
stored in the PEM file. The certificate file must contain the complete 
certificate chain. Create a docker-compose override file with this 
information, for example mine named base.prod.yaml something like this:
```yaml   
    version: '3.2'
    services:
      base-nginx:
        image: cvs/base-nginx
        build:
          context: nginx
          args:
            SERVERNAME: cvs.solutions
            FULLCHAIN_PEM: |
              -----BEGIN CERTIFICATE-----
              MIIC0DCCAbigAwIBAgIUQ3NgEY2DeXJrZlZ+aXjhqFFBQB4wDQYJKoZIhvcNAQEL
              BQAwETEPMA0GA1UEAwwGdWJ1bnR1MB4XDTIwMDQyNjE2NDYwNFoXDTMwMDQyNDE2
              NDYwNFowETEPMA0GA1UEAwwGdWJ1bnR1MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
              MIIBCgKCAQEAsoXurs66GcxUOFri3xOQrh5AtErsw2cDmOcMScp2UOiUybdYOTOZ
              UVlQ3MP/Pf6JuPaGzEoblu945//f3SCGo2CXZKqrw8MbTietn5APii3MPUEuQ+K4
              MdlT2dGXZrNxTyHm2ZTlYcVS3YWJ5fwVGIIHhdgl6ApcMajMqlxgHcNDy5zMM3Q2
              a4GYnUBnf5sBrPRzqTYDn/nkC8YfVGmx8Ey8n93FiXSMfZV+BlGa1FwfTZoh+Df/
              9Wd2oY62SQGguNQK/W3WSUgcVBgulbGflCPVJTeUbbi54YiEdkjF7vHpRS+QISub
              lJSaOE2oyun8irarGXS7X1oOJeBPky5/MwIDAQABoyAwHjAJBgNVHRMEAjAAMBEG
              A1UdEQQKMAiCBnVidW50dTANBgkqhkiG9w0BAQsFAAOCAQEAMlKu1lp1kvH3rxv0
              q4OEUKzfUXT1F3W7kRMQOhaMqFZsD+ZCRgPeFiLNEzXYGpdFWHRhfZWXEXH2F8fz
              V1a7i3ZL0pI4TS6SweacNec++AnaAdsjLvUYs97g9R7ASCAbLW/kKgcKOTTZoDGz
              nolr9RQsHWlNyM25Q4d2I+GGkYe1jSR5fUPnkVo2ViiPqBtMP50bUmtP679tT/a2
              7TQBXTshdWl35FtPlpEKX6d2hjmyVVz9qUPYL62gX8TAxkt1D0SwZPpTLk8oM9Ne
              ywmSRsZaS4QEH63r1IBoX5ikS2oyrvTou6hdilu91SODcVQLNB6iL8Xaj00Z36qv
              O40OLg==
              -----END CERTIFICATE-----
            PRIVKEY_PEM: |
              -----BEGIN PRIVATE KEY-----
              MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCyhe6uzroZzFQ4
              WuLfE5CuHkC0SuzDZwOY5wxJynZQ6JTJt1g5M5lRWVDcw/89/om49obMShuW73jn
              /9/dIIajYJdkqqvDwxtOJ62fkA+KLcw9QS5D4rgx2VPZ0Zdms3FPIebZlOVhxVLd
              hYnl/BUYggeF2CXoClwxqMyqXGAdw0PLnMwzdDZrgZidQGd/mwGs9HOpNgOf+eQL
              xh9UabHwTLyf3cWJdIx9lX4GUZrUXB9NmiH4N//1Z3ahjrZJAaC41Ar9bdZJSBxU
              GC6VsZ+UI9UlN5RtuLnhiIR2SMXu8elFL5AhK5uUlJo4TajK6fyKtqsZdLtfWg4l
              4E+TLn8zAgMBAAECggEAL6BjiOdF5tQIM/CrTfAeTRVtFaxXddnpr8UUFiuZXQRv
              jVEIjFojsPwvAnaXhaZ+f4XleGLc8Wt5ygsNYiTnRnbibMzLfjJy+mrDeyonuyl0
              r3LQMPQvR70/DYFI7vE4bXAR8kIy396QuOCDZYPW7O7jquV7V2hMKENsNpbmXYnk
              Sodp+GpsejCi/EzwucK+cH3BaIKlSzCLP6m851aVZzDgcXwNkCVEhgMrFAtDdw7k
              rseE1/TRrSZocDe9H4+Km8F9KJIZ6dGge5umTdbjJrD8Zs8XavADbwrZryZVm4Xl
              tn943ze8EIU7OK+qLYpar4SzkB7g057B9Y0n6driAQKBgQDd/uBCY5UNtfwf/ZH+
              WYmVBos2k5C3Cs/iSXK7R+xV98YuZzimqxUcCfjVq5Vlx16V9CORVPojj4Xkq8ZW
              Hbfk9mLTXqNyIhhgbN+hW+Mg4hfYPolvqFUAIQm1US18RIm7yIPGCLMYMX4cB1X3
              7Uu9t80+OEEqjEsuBTy2E7LI8wKBgQDN3l6lk12JC06TbyEwTGES4HLu3QKDQhaG
              0nnckM1LIsc4RIbp3KIFZnBOSeRVWKAf5yLCi45PKX8YKLvwjI84wOsGZKTBGfT0
              7iFFsVN86lQZIkBL3Vok8eSl4kfJyO2TvZr9XJOGBNVPiw+paPF3jHa0UgahXNDU
              O9PWikcAwQKBgAeqYGYKeEAj85PLNrpYryaFNlNpHwsjBXCj5qFO53tEdgRuLgeb
              SrxQH9aI+TyteLem2X+QNp75ur7dq5iXqBzw4RK5Zt1vDfZua/5vZNVi2T3vUuGX
              J3A8s9AeAHsVBsiEMQCqljyUoO0o17Aa8o2Xhi/K0307oPDy31jOL1M/AoGBAKC4
              89F2rHaaojzObO3FI6BWJMTBPP32sZmOZt9BGVWIkFoofd/EhaWLpTAp1h6fc1uU
              2vlhdLfu4K+e1aNmSUZ4rsQt/MZZGnnCE63SVCjY1NFOgT35UTA4vVaYw40Q1hIa
              3A7joLTnvxU7rv2G1cWMnvwGcfC2gr6++pKrH+XBAoGAC02qwObTtiZZDYtdDHzn
              5u6Dj7iEaewZ+4GxKjvVJe+edQhnbx6G+beyGOkOBydVnYEsJC8slZTbnhqIMdJ1
              OgGtge8w+tSv1qo6SuGoCZaJsEeBcpChvHIKcpEGrXFrpHkKkWF3Aia71Cqe+odb
              WUkzgs9KCFXQmVfL5Xp2+k4=
              -----END PRIVATE KEY-----
        container_name: cvs-base-nginx
```
This file need for set your hostname and your SSL certs. Run following commands 
to build PROD images.

    docker-compose -f Docker/bases/docker-compose.yaml -f bases.prod.yaml build
    docker-compose -f Docker/server/docker-compose.yaml build
    docker-compose -f Docker/videoroom/docker-compose.yaml build

### Run docker images
Just run the following commands to launch the docker images and start testing 
the application.

    docker-compose -f Docker/server/docker-compose.yaml \
                   -f Docker/videoroom/docker-compose.yaml up -d
