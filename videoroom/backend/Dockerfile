FROM cvs/base-python
WORKDIR /usr/src/sdk
COPY  ./python .
RUN python setup.py install
WORKDIR /usr/src/app
COPY  samples/VideoRoom .
RUN python setup.py install
