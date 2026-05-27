# Jupyter book

This site has been build using [Jupyter Book](https://jupyterbook.org/). When the web site is render from the repository the Jupyter Notebooks needs to be rendered so that means that all the python modules needs to be installed. As the homomorphic encryption modules used in the Jupyter Notebooks used in this site are not easy to install you can use the container provided by this repository just to render the site.

First you must start the container mapping the code repository directory to container's directory **/home/qcomputing/data**:

```console
$ podman run --rm --userns=keep-id  --name qhe -p 8888:8888 -v /home/jadebustos/src/mygithub/qhe:/home/qcomputing/data:Z quay.io/rhte_2019/qhe:latest
..
```

After that attach a console and go to **/home/qcomputing/data** and render the site:

```console
$ adebustos@archimedes:~/src/mygithub/qhe$ podman exec -it qhe /bin/bash
(venv) qcomputing@e023dae88f7f:/workspace$ cd    
(venv) qcomputing@e023dae88f7f:~$ cd data/
(venv) qcomputing@e023dae88f7f:~/data$ ls
Containers  LICENSE  README-structure.md  README.md  _build  _config.yml  _toc.yml  chapters  commit.sh  intro.md  notebooks  old  references.bib  requirements.txt
(venv) qcomputing@e023dae88f7f:~/data$ jupyter-book build .
...
$
...

Then push your changes to your Github repository and let github actions to do its magic.