FROM python:3.8

RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
    bash ~/.bash_it/install.sh --silent

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get upgrade -y && \
    apt-get install -y nodejs texlive-latex-extra texlive-xetex && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install --upgrade \
    jupyterlab \
    ipywidgets \
    jupyterlab_latex \
    plotly \
    bokeh \
    numpy \
    scipy \
    scikit-learn \
    scikit-image \
    simpy \
    matplotlib \
    ipython \
    pandas \
    sympy \
    seaborn \
    pytest \
    jupyterlab-git && \
    jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager \
    @jupyterlab/latex \
    jupyterlab-drawio \ 
    jupyterlab-plotly \
    @bokeh/jupyter_bokeh \
    @jupyterlab/git

COPY settings/settings.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/settings.sh
COPY config/ /root/.jupyter/

EXPOSE 8888
VOLUME /notebook
WORKDIR /notebook

ENTRYPOINT ["settings.sh"]
