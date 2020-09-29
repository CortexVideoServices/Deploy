FROM cvs/base-python

WORKDIR /usr/src/app
COPY  ./samples/VideoRoom .
RUN python setup.py install