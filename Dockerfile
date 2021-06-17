FROM openjdk:7 as builder

WORKDIR /usr/app

COPY ./* /usr/app/

RUN javac DockerFive.java

FROM openjdk:15 as runner

WORKDIR /usr/app

COPY --from=0 /usr/app/DockerFive.class /usr/app/ 

CMD ["java","DockerFive"]