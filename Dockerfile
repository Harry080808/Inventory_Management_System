# ---- Build Stage ----
FROM maven:3.8.3-openjdk-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy pom.xml first to leverage Docker cache
COPY pom.xml .

# Download dependencies (cached layer)
RUN mvn dependency:go-offline -B

# Copy the entire project
COPY src ./src

# Build the application (skip tests to speed up)
RUN mvn clean package -DskipTests


# ---- Run Stage ----
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy WAR file from build stage
COPY --from=build /app/target/*.war app.war

# Expose port 8080 (Clever Cloud auto-detects this)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.war"]
