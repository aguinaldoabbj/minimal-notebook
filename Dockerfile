FROM jupyter/minimal-notebook

RUN conda install --yes --freeze-installed \
    -c conda-forge \
    conda-build \
    pandas \
    numpy \
    && conda build purge-all \
    && find /opt/conda/ -type f,l -name '*.a' -delete \
    && find /opt/conda/ -type f,l -name '*.pyc' -delete \
    && find /opt/conda/ -type f,l -name '*.js.map' -delete \
    && rm -rf /opt/conda/pkgs

COPY gituserconf.sh /gituserconf.sh

USER root

RUN chmod +x /gituserconf.sh

#adding git config script to the top of entrypoint script
RUN sed -i '5s/^/\/gituserconf.sh\&\n\n/' /usr/local/bin/start-singleuser.sh

USER $NB_UID
