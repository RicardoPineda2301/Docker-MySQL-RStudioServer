FROM mysql:latest

RUN mkdir -p /home/parcial/
WORKDIR /home/parcial

ENV MYSQL_ROOT_PASSWORD pass
ENV MYSQL_DATABASE parcial1_dp
ENV MYSQL_USER ricardo
ENV MYSQL_PASSWORD pass


COPY data/ /home/parcial

ADD load_data.sql /docker-entrypoint-initdb.d

EXPOSE 3306