
# Build React frontend
FROM node:22 AS frontend-build
WORKDIR /app/frontend
COPY smarthire-frontend/package*.json ./
RUN npm ci
COPY smarthire-frontend/ ./
RUN npm run build

# Build Spring Boot backend
FROM maven:3.9-eclipse-temurin-17 AS backend-build
WORKDIR /app
COPY smarthire-backend/pom.xml .
COPY smarthire-backend/src ./src
COPY --from=frontend-build /app/frontend/dist ./src/main/resources/static
RUN mvn clean package -DskipTests

# Run the application
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=backend-build /app/target/*.jar app.jar
CMD ["sh", "-c", "java -Dserver.port=${PORT:-8080} -jar app.jar"]
