FROM jupyter/minimal-notebook

RUN conda install --yes --freeze-installed \
    -c conda-forge \
    conda-build \
    pandas \
    numpy \
    matplotlib \
    xlrd \
    && conda build purge-all \
    && /opt/conda/bin/conda clean -afy \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs
    
COPY gituserconf.sh /gituserconf.sh

USER root

RUN chmod +x /gituserconf.sh && /gituserconf.sh

RUN apt-get update && apt-get install -y \
    htop \
    && rm -rf /var/lib/apt/lists/*

USER $NB_UID
