FROM jupyter/minimal-notebook

COPY gituserconf.sh /gituserconf.sh

RUN chmod +x /gituserconf.sh

#adding password change script to the top of entrypoint script
RUN sed -i '5s/^/\/gituserconf.sh\&\n\n/' /usr/local/bin/start-notebook.sh
