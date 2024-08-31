# Use uma imagem base com o JDK
FROM openjdk:17-jdk-slim

# Copie o JAR da aplicação para o contêiner
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

#usar uma imagem base do maven para construir
FROM maven:3.8.6-jdk-17 AS build

#Define o diretorio de trabalho
WORKDIR /app

# Copia o pom.xml e o codigo fonte
COPY pom.xml .
COPY src ./src

#Compila o aplicativo
RUN mvn clean package -DskipTests

# Exponha a porta na qual a aplicação irá rodar
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]
