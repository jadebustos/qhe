# Jupyter book

This site has been build using [Jupyter Book](https://jupyterbook.org/). When the web site is render from the repository the Jupyter Notebooks needs to be rendered so that means that all the python modules needs to be installed. As the homomorphic encryption modules used in the Jupyter Notebooks used in this site are not easy to install you can use the container provided by this repository just to render the site.

First you must start the container mapping the code repository directory to container's directory **/home/qcomputing/data**:

```console
$ podman run --rm --userns=keep-id  --name qhe -p 8888:8888 \
    -v /home/jadebustos/src/mygithub/qhe:/home/qcomputing/data:Z \
    quay.io/rhte_2019/qhe:latest
..
```

After that attach a console and go to **/home/qcomputing/data** and render the site:

```console
$ adebustos@archimedes:~/src/mygithub/qhe$ podman exec -it qhe /bin/bash
(venv) qcomputing@e023dae88f7f:/workspace$ cd    
(venv) qcomputing@e023dae88f7f:~$ cd data/
(venv) qcomputing@e023dae88f7f:~/data$ ls -lh
total 76K
drwxrwxrwx. 2 qcomputing qcomputing  190 May 27 15:58 Containers
-rwxr-xr-x. 1 qcomputing qcomputing  35K May 27 15:58 LICENSE
-rwxr-xr-x. 1 qcomputing qcomputing 1.8K May 27 15:58 README-structure.md
-rwxr-xr-x. 1 qcomputing qcomputing  409 May 27 15:58 README.md
drwxr-xr-x. 5 qcomputing qcomputing   58 May 27 15:55 _build
-rwxr-xr-x. 1 qcomputing qcomputing 1.1K May 27 15:58 _config.yml
-rwxr-xr-x. 1 qcomputing qcomputing 1.4K May 27 16:23 _toc.yml
drwxrwxrwx. 5 qcomputing qcomputing   36 May 24 21:46 chapters
-rwxrwxrwx. 1 qcomputing qcomputing 2.0K May 24 21:46 commit.sh
-rwxr-xr-x. 1 qcomputing qcomputing 1.2K May 27 15:58 intro.md
drwxrwxrwx. 3 qcomputing qcomputing   89 May 24 20:31 notebooks
drwxrwxrwx. 3 qcomputing qcomputing   19 May 24 20:31 old
-rwxrwxrwx. 1 qcomputing qcomputing 9.3K May 24 20:37 references.bib
-rwxr-xr-x. 1 qcomputing qcomputing   37 May 27 15:58 requirements.txt
(venv) qcomputing@e023dae88f7f:~/data$ jupyter-book build .
...
$
```

Then push your changes to your Github repository and let github actions to do its magic.