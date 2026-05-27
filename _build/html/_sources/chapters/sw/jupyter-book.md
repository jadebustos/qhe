# Jupyter book

```console
$ podman run --rm --name qhe -p 8888:8888 -v $(pwd):/workspace:Z -v $(pwd):/home/qcomputing/data localhost/qhe:latest
..
```

```console
$ adebustos@archimedes:~/src/mygithub/qhe$ podman exec -it qhe /bin/bash
(venv) qcomputing@e023dae88f7f:/workspace$ cd    
(venv) qcomputing@e023dae88f7f:~$ cd data/
(venv) qcomputing@e023dae88f7f:~/data$ ls
Containers  LICENSE  README-structure.md  README.md  _build  _config.yml  _toc.yml  chapters  commit.sh  intro.md  notebooks  old  references.bib  requirements.txt
(venv) qcomputing@e023dae88f7f:~/data$ 
...
$