# README

These examples uses [Podman](https://podman.io/) but if you prefer to use Docker you will only need to replace **podman** by **docker** on the commands.

You can also use [Podman Desktop](https://podman-desktop.io/) to easyly run containers from your favorite Operating System using a Graphical User Interface.

You have different options to try this notebook:

* You can create the container by yourself.
* You can get the container from my container repository:

  ```console
  $ podman pull quay.io/rhte_2019/qhe:latest
  ```

  and after that running it.

## Creating the container

We will build the container in two phases:

1. Clone the Pyfhel repository:

   ```console
   $ git clone --recursive https://github.com/ibarrond/Pyfhel.git
   ```

   Go to the repository directory, edit the _Dockerfile_ and change the base image to use **ubuntu:24.04** instead of **ubuntu:latest**:

   ```dockerfile
   FROM ubuntu:24.04
   ```

   Create the container:

   ```
   $ podman build -t pyfhel .
   ...
   $ podman images
   REPOSITORY                 TAG         IMAGE ID      CREATED       SIZE
   localhost/pyfhel           latest      241c576f789d  17 hours ago  954 MB
   $
   ```
2. From this directory create the container to run quantum computing code:

  ```console
  $ podman build -t qhe:1.0 .
  ...
  $ podman images
  REPOSITORY                 TAG         IMAGE ID      CREATED       SIZE
  localhost/qhe              1.0         3d606bff58a9  17 hours ago  1.38 GB
  $
  ```

## Running the container

Go to the directory where you have the jupyter notebooks you want to run:

```console
$ podman run -p 8888:8888 -v $(pwd):/workspace:Z localhost/qhe:1.0
```

If you are not using SELinux you can remove **:Z**.

If you downloaded it from my container repository:

```console
$ podman run --rm -d --name qhe -p 8888:8888 quay.io/rhte_2019/qhe:latest
```

Now you can use your favorite browser to browse https://localhost:8888

## Custom configuration (Not yet implemented)

You can create your custom configuration file **jupyter_server_config.json**:

```json
{
  "IdentityProvider": {
    "hashed_password": "argon2:..."
  }
}
```

Where the hashed password can be created:

```console
$ JUPYTER_CONFIG_DIR=$PWD jupyter server password
Enter password:
Verify password:
[JupyterPasswordApp] Wrote hashed password to ./jupyter_server_config.json
$ cat jupyter_server_config.json
{
  "IdentityProvider": {
    "hashed_password": "argon2:..."
  }
}
```

You can add this file via a secret volume to your container, mounting it in _/home/notebook/.jupyter/jupyter_server_config.json_
