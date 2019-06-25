# jupyter-notebooks

> Docker image for data science projects using Python and Jupyter Notebooks.

This repository can serve as the basis for a project utilizing Jupyter Notebooks and the associated
python scientific computing and data science packages (`pandas`/`geopandas`, `matplotlib`, etc.)

It can also be used directly as an ad-hoc Jupyter Notebook server.

## Ad-hoc Jupyter Notebook server

This repository provides an environment for working with Jupyter Notebooks that is quick and easy to setup.

First, build the Docker image from the `Dockerfile` in this repository:

```bash
docker build -t jupyter_notebooks:latest .
```

The syntax is: `docker build -t TAG:VERSION BUILD_CONTEXT` where:

* `TAG:VERSION` is `jupyter_notebooks:latest`
* `BUILD_CONTEXT` is the current directory `.`

Then start the Jupyter Notebook server:

```bash
$ docker run -p 8888:8888 jupyter_notebooks
[I HH:MM:SS NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[I HH:MM:SS NotebookApp] Serving notebooks from local directory: /usr/src/notebooks
[I HH:MM:SS NotebookApp] The Jupyter Notebook is running at:
[I HH:MM:SS NotebookApp] http://(1c2d6dfb53df or 127.0.0.1):8888/?token=<token>
```

The syntax is `docker run -p LOCAL_PORT:CONTAINER_PORT IMAGE_NAME` where:

* `LOCAL_PORT` is `8888`, modify as needed
* `CONTAINER_PORT` is `8888`, hardcoded in the `Dockerfile` and baked into the built Docker image
* `IMAGE_NAME` is `jupyter_notebooks`, what we just built in the step above

Now browse to http://localhost:LOCAL_PORT/?token=, using the token shown in the container startup output.

**IMPORTANT**: by default, anything persisted inside the container (e.g. creating new Notebook files) is destroyed when
the container shuts down.

## Base another project on this repository

This repository can also serve as a quick-start for new python data science projects.

First, create a *new* project directory/git repository:

```bash
mkdir new-project

cd new-project

git init
```

Next, add *this* repository as a submodule in the *new* repository:

```bash
git submodule add https://github.com/CityofSantaMonica/jupyter-notebooks.git

git submodule update --init
```

Copy the sample `docker-compose.yml` file into the *new* repository:

```bash
cp ./jupyter-notebooks/docker-compose.sample.yml docker-compose.yml
```

And edit as neccessary:

* `SERVICE_NAME` should be replaced by the name of your project e.g. `analysis`
* `LOCAL_PORT` should be replaced by the port that you want to utilize from localhost.

Build the base image using Docker Compose:

```bash
docker-compose build base
```

And use Docker Compose to start the whole thing up:

```bash
docker-compose up <SERVICE_NAME>
```

Browse to http://localhost:LOCAL_PORT/?token= using the token displayed in the container startup information.

**IMPORTANT:** the *new* project's root directory is mapped into the Notebook server, and all changes are synced back and forth.
