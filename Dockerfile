FROM jupyter/scipy-notebook
FROM centos:7

RUN yum -y install python3-pip \
    pip3 install joblib\
	pip3 install pandas\
	pip3 install numpy


USER root

RUN yum update -y 
RUN yum install epel-release -y
RUN yum install jq.x86_64 -y


RUN mkdir model raw_data  processed_data results


ENV RAW_DATA_DIR=/home/jovyan/raw_data
ENV PROCESSED_DATA_DIR=/home/jovyan/processed_data
ENV MODEL_DIR=/home/jovyan/model
ENV RESULTS_DIR=/home/jovyan/results
ENV RAW_DATA_FILE=Iris.csv


COPY Iris.csv ./raw_data/Iris.csv
COPY train.py ./train.py
COPY test.py ./test.py
COPY preprocessing.py ./preprocessing.py