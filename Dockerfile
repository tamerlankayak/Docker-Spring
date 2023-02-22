# FROM openjdk:17-alpine
# COPY target/*.jar app.jar
# EXPOSE 5000
# ENTRYPOINT ["java","-jar","/app.jar"]

FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /home/app
COPY . /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:17-alpine
VOLUME /tmp
EXPOSE 8080
COPY --from=build /home/app/target/*jar app.jar
ENTRYPOINT [ "sh","-c","java -jar /app.jar" ]
