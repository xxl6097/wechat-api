# Use the official maven/Java 8 image to create a build artifact.
# https://hub.docker.com/_/maven
FROM gradle:3.5-jdk-8-alpine as builder

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
CMD ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=8080","-jar","/app/target/we-api-1.0-SNAPSHOT-boot.jar"]

