FROM maven:3.8.3-openjdk-17 as builder



WORKDIR /opt

RUN git clone https://github.com/marinosxaritos/TexnologiaLogismikoudemo.git app

WORKDIR /opt/app

RUN mvn package

FROM openjdk:11.0.13-jre

COPY --from=builder /opt/app/target/TexnologiaLogismikoudemo-0.0.1-SNAPSHOT.jar /opt/app.jar

EXPOSE 8080

CMD ["java","-jar","/opt/app.jar"]