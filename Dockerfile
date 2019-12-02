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
    
RUN pip install pykube-ng

COPY gituserconf.sh /gituserconf.sh

USER root

RUN chmod +x /gituserconf.sh && /gituserconf.sh

#adding git config script to the top of entrypoint script
#RUN sed -i '5s/^/\/gituserconf.sh\&\n\n/' /usr/local/bin/start-singleuser.sh

USER $NB_UID
