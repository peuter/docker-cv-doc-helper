Docker Image for CometVisu documentation
========================================

This docker image provides everything needed to generate the HTML docemantation
of the CometVisu

Prerequisites (for running the container locally)
-------------------------------------------------

Please make sure that you set the environment variable `COMETVISU_PATH`
which points to a local git clone of the CometVisu repository.
The submodule used here does not work, it must be a real clone of the repo.

```
export COMETVISU_PATH=absolute-path-to-your-cometvisu-clone
```

Build + Run
-----------

There are two helper script to generate the docker image:

* `build.sh`: Build the image (needed after every change to the `Dockerfile`)
* `run.sh`: Run the docker build, if you need to append more than one
            parameter, you have to put them in braces, e.g. `./run.sh "-f -c"`