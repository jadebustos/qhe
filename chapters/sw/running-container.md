## Running the container

Go to the directory where you have the Jupyter Notebooks you want to run:

```console
$ podman run --rm --name qhe -p 8888:8888 -v $(pwd):/workspace:Z localhost/qhe:1.0
```

If you are not using SELinux you can skip **:Z**. Ensure write privileges for all users in the notebooks directory due to Jupyterlab will be executing as a non-root user.

If you downloaded it from my container repository:

```console
$ podman run --rm --name qhe -p 8888:8888 -v $(pwd):/workspace:Z quay.io/rhte_2019/qhe:latest
```

Now you can use your favorite browser to browse https://localhost:8888

## Running the container using your custom configuration

You can create your custom configuration file [jupyter_server_config.json](jupyter_server_config.json.example).:

Where the hashed password can be created:

```console
$ JUPYTER_CONFIG_DIR=$PWD jupyter server password
Enter password:
Verify password:
[JupyterPasswordApp] Wrote hashed password to ./jupyter_server_config.json
$ cat jupyter_server_config.json
{
  "IdentityProvider": {
    "hashed_password": "argon2:19$..."
  }
}
$
```

You can add this file via a volume to your container:

```console
$ podman run --rm --name qhe -v $(pwd):/workspace:Z \
  -v ../Containers/jupyter_server_config.json:/home/qcomputing/.jupyter/jupyter_server_config.json:ro \
  -v $(pwd):/workspace:Z -p 8888:8888 localhost/qhe:1.0
...
$
```

You can also create your own certificates and map them as a volume:

* Map your key to **/home/qcomputing/.jupyter/certs/jupyter.key**.
* Map your certificate to **/home/qcomputing/.jupyter/certs/jupyter.crt**.

## Attaching a shell to the running container

To attach a shell to the running container named **qhe**:

```console
$ podman exec -it qhe /bin/bash
(venv) qcomputing@bd89748d680f:/workspace$ 
```
