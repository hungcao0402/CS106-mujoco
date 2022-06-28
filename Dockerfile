FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-runtime

ENV debian_frontend=noninteractive

WORKDIR /tianshou

COPY . /tianshou/

RUN apt-get update -y && apt-get install -y libglib2.0-dev libsm6 libxext6 libxrender-dev freeglut3-dev ffmpeg  mesa-common-dev
RUN pip install matplotlib tianshou envpool

CMD /bin/bash
