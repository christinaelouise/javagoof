FROM maven:3-jdk-8-slim

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
COPY cert.pem /usr/src/goof
COPY key.pem /usr/src/goof
WORKDIR /usr/src/goof

ENV JAVA_TOOL_OPTIONS=-javaagent:/usr/src/goof/trend_app_protect-4.2.0.jar
ENV TREND_AP_KEY=ddd178f8-951a-430a-ba38-d09959a9ee39
ENV TREND_AP_SECRET=74920a54-f222-4ef3-8efe-d690350e1556
ENV TREND_AP_LOG_FILE=STDERR

RUN mvn install

EXPOSE 8080
ENTRYPOINT ["mvn", "tomcat7:run"]
