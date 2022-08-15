FROM jupyter/tensorflow-notebook:latest

USER root
RUN apt-get update && apt-get --yes install apt-utils
RUN apt-get --yes install curl

USER ${NB_UID}

