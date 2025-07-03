FROM ubuntu:20.04

RUN apt-get update && apt-get install -y gnat gprbuild

WORKDIR /learning_ada

COPY . .