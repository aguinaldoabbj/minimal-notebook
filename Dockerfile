FROM jupyter/minimal-notebook

COPY gituserconf.sh /gituserconf.sh

USER root

RUN chmod +x /gituserconf.sh

#adding git config script to the top of entrypoint script
RUN sed -i '5s/^/\/gituserconf.sh\&\n\n/' /usr/local/bin/start-singleuser.sh

USER $NB_UID
