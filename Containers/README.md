# README

These examples uses [Podman](https://podman.io/) but if you prefer to use Docker you will only need to replace **podman** by **docker** on the commands.

You can also use [Podman Desktop](https://podman-desktop.io/) to easyly run containers from your favorite Operating System using a Grafphical User Interface.

You have different options to try this notebook:

* You can create the container by you self.
* You can get the container from my container repository:

  ```console
  $ podman pull quay.io/rhte_2019/qhe:latest
  ```

  and after that running it.

* You can download the notebooks and run them in your environment.

## Creating the container

In the directory where the _Containerfile_ is:

```console
$ podman build -t qhe:v1.0 .
...
$ podman images
REPOSITORY                  TAG                    IMAGE ID      CREATED         SIZE
localhost/qhe               v1.0                   9a61b32b7696  10 seconds ago  2.31 GB
...
$
```

## Running the container

If you only want to try the examples included in the container:

```console
$ podman run --rm -d --name qhe -p 8888:8888 localhost/qhe:v1.0
```

If you downloaded from my container repository:

```console
$ podman run --rm -d --name qhe -p 8888:8888 quay.io/rhte_2019/qhe:latest
```

If you want to run your own notebooks you need to mount the directory where the notebooks are:


```console
$ podman run --rm -d --name qhe -v <YOUR NOTEBOOKS' DIRECTORY>:/home/notebook/data:Z -p 8888:8888 localhost/qhe:v1.0
```

If you downloaded from my container repository:

```console
$ podman run --rm -d --name qhe -v <YOUR NOTEBOOKS' DIRECTORY>:/home/notebook/data:Z -p 8888:8888 quay.io/rhte_2019/qhe:latest
```

Now you can use your favorite browser to browse https://localhost:8888

## Custom configuration 

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
