FROM gradle:4.10-jdk8-alpine AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
#RUN gradle build --no-daemon



#FROM openjdk:8-jre-alpine
## Copy local code to the container image.
WORKDIR /app
COPY we-api .
COPY gradlew.bat .
COPY build.gradle .
COPY settings.gradle .
COPY gradlew .
#
#RUN pwd
## Build a release artifact.
RUN gradle build
#
## Run the web service on container startup.
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=8080","-jar","/app/we-api/build/libs/we-api-0.0.1.jar"]

