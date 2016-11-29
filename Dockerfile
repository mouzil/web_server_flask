#FROM fedora:23
#MAINTAINER mouzil

#RUN dnf -y install git python-pip

#RUN python3 -m pip install -U pip
#RUN pip3 install flask"
#RUN pip3 install flask_script
#RUN pip3 install flask_bootstrap
#RUN pip3 install flask_moment
#RUN pip3 install flask_wtf
#RUN mkdir -p /home/dev
#WORKDIR /home/dev
#RUN git clone https://github.com/astondevops/web_server_flask.git
#EXPOSE 5000
#WORKDIR /home/dev/web_server_flask
#ENTRYPOINT ["python3","hello.py","runserver"]


#RUN dnf -y update
#RUN dnf -y install wget
#RUN dnf -y install tar
#RUN dnf -y install java-1.8.0-openjdk.x86_64
#RUN wget http://apache.mediamirrors.org//jmeter/binaries/apache-jmeter-3.1.tgz
#RUN tar -xvzf apache-jmeter-3.1.tgz
#RUN rm -f apache-jmeter-3.1.tgz
#RUN rm -fr /apache-jmeter-3.1/docs
#RUN mkdir results
#COPY *.jmx ./
#COPY *.csv ./
#VOLUME /results
##version freddy - ajpout de entrypoint
#ENTRYPOINT ["python3", "hello.py", "runserver"]
#CMD ["-h=0.0.0.0"]

FROM fedora:23
MAINTAINER MOUZIL
RUN dnf -y update \
    && dnf -y install git python-pip \
    && python3 -m pip install -U pip \
    && dnf clean all

COPY requirements.txt /
RUN pip3 install -r /requirements.txt

RUN  mkdir -p /home/dev/web_server_flask
WORKDIR /home/dev/web_server_flask
COPY hello.py .
COPY README.md /home/dev/web_server_flask
ADD templates /home/dev/web_server_flask/templates
ADD static /home/dev/web_server_flask/static

EXPOSE 5000

ENTRYPOINT ["python3","hello.py","runserver"]
CMD ["-h=0.0.0.0"]