## Hasher Webserver

#### How to build into a docker image

```
$ docker build . -t hasher-webserver
```

#### How to make a container from the docker image

```
$ docker run -p 4567:4567 hasher-webserver
```
