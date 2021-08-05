# Use the official maven/Java 8 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM openjdk:8-jdk-alpine

# Copy local code to the container image.
WORKDIR /app
COPY we-api .
COPY gradlew.bat .
COPY build.gradle .
COPY settings.gradle .
COPY gradlew .

# Build a release artifact.
RUN ./gradlew build -DskipTests

# Run the web service on container startup.
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=8080","-jar","/app/we-api/build/libs/we-api-0.0.1.jar"]

