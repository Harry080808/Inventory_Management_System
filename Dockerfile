# Dockerfile for Spring Boot Application

# Option 1: Using WAR file with embedded server (RECOMMENDED for Spring Boot)
FROM openjdk:17-jre-slim

WORKDIR /app

# Copy the WAR file
COPY Inventory_Management_System-0.0.1-SNAPSHOT.war app.war

# Expose port 8080
EXPOSE 8080

# Run the Spring Boot WAR with embedded server
CMD ["java", "-jar", "app.war"]

# Option 2: Multi-stage build (if you want to build inside Docker)
# FROM openjdk:17-jdk-slim as builder
# WORKDIR /build
# COPY pom.xml .
# COPY src ./src
# COPY mvnw .
# COPY .mvn .mvn
# RUN chmod +x mvnw
# RUN ./mvnw clean package -DskipTests
# 
# FROM openjdk:17-jre-slim
# WORKDIR /app
# COPY --from=builder /build/target/*.war app.war
# EXPOSE 8080
# CMD ["java", "-jar", "app.war"]

# Option 3: If you prefer JAR packaging
# Change your pom.xml packaging to <packaging>jar</packaging>
# Then use: CMD ["java", "-jar", "app.jar"]