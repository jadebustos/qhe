## Creating the container

We will build the container in two phases. From the directory where the Containerfile is:

* Creating the container certificates:

  ```console
  $ SERVER_NAME=jupyter.local SERVER_IP=192.168.1.250 CERT_DAYS=90 KEY_BITS=4096 \
      KEY_NAME=jupyter.key CERT_NAME=jupyter.crt ./certificate-creation.sh
  ```

* Building the container:

  ```console
  $ podman build -t qhe:1.0 -f Containerfile . 
  ...
  $ podman images
  REPOSITORY                 TAG         IMAGE ID      CREATED       SIZE
  localhost/qhe              1.0         b2955f6be9c3  13 seconds ago      841 MB
  <none>                     <none>      5029d1ec36b4  About a minute ago  1.26 GB
  docker.io/library/ubuntu   24.04       0b1ebe5dd426  4 weeks ago         80.7 MB
  $
  ```

:::{admonition} You can also include building args to the container image
:class: tip

  ```console
  $ podman build --build-arg BUILD_DATE="$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
      --build-arg VCS_REF="$(git rev-parse \
      --short HEAD 2>/dev/null || echo 'no-git')" -t qhe:1.0 -f Containerfile .
...
$
```
:::
