# 🍺Dupyter = 📦Docker + 🧪Jupyter Lab
> Customizable Jupyter Lab running in a docker container

Reproducible Jupyter environment for ML, data science, engineering, and the sciences

## Getting Started
Clone. Run. Easy.
```bash
git clone https://github.com/Proteusiq/dupyter.git && cd dupyter
docker-compose up
```
::Note:: The first build will take a while. Go and grab a cup of coffee.

Default JupyterLab Password in `jupyterlabpwd`. You can change it by editing notebook.env. Rebuild, `docker-compose build`, for the new changes to take effect.

Jupyter lab will be running on localhost, port 8888: `http://localhost:8888/lab?`. You can change the port if 8888 is not
available. Open `docker-compose.yaml` and change port. For example, `9004:8888`, will forward Jupyter Lab service to `http://localhost:9004/lab?`

[Optional] Tweak `Dockerfile` to fit your base packages


## 42

Add Python packages, Jupyter Lab extensions, and Linux packages at run time. Python libraries in `projects/requirments.txt`, would be installed via `pip`, Jupyter Lab extension in `projects/extensions.txt` via `npm`, and 'apt ` install packages from `projects/packages.txt`.

_Example_: In requirements.txt, we have added `httpx` and in packages.txt, `telnet`. These requirements will be installed at run time. Try open and paste `telnet towel.blinkenlights.nl` on the terminal after starting dupyter. 

## Machine Learning Libraries
- numpy -- the heart of scientific computing in Python
- scipy -- collection of tools for mathematics, science, and engineering
- sympy -- a Python library for symbolic mathematics
- scikit-learn -- a collection of algorithms and tools for machine learning
- scikit-image -- a collection of algorithms for image processing
- simpy -- a process-based discrete-event simulation framework based on standard Python
- pandas -- high-performance, easy-to-use data structures

    
## Visualization 
- matplotlib -- comprehensive library for creating static, animated, and interactive visualizations in Python
- seaborn -- statistical data visualization tools
- plotly -- interactive and beautiful data vizulation tools
- bokeh -- yet another interactive and beautiful data vizulation tools


## Tools
- pytest -- best way to write and run unit tests.
- ipython -- a rich and powerful interactive shell 
- ipywidgets -- framework to provide eventful python objects that have a representation in the browser
- jupyterlab_latex -- extension to allow live-editing of LaTeX documents
- jupyterlab-git -- git clone repositories to local environment from Jupyter Lab
- jupyterlab-drawio -- extension for standalone integration of drawio/mxgraph into Jupyter Lab.
