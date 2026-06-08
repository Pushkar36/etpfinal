FROM eclipse-temurin:17

WORKDIR /devops-ptc

COPY Hello.java .

RUN javac Hello.java

CMD ["java", "Hello"]