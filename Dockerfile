# -------- Stage 1 : Build WAR --------
FROM maven:3.9.6-eclipse-temurin-8 AS builder

WORKDIR /app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

# -------- Stage 2 : Run on Tomcat --------
FROM tomcat:9.0-jdk8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=builder /app/target/ojpms.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh","run"]