# Use a base Java image
FROM openjdk:17.0.1-jdk-slim

# Install necessary utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Copy your Java app
COPY app.jar /app/app.jar

# Download and copy the JMX Exporter JAR
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/1.0.1/jmx_prometheus_javaagent-1.0.1.jar /app/jmx_prometheus_javaagent.jar

# Copy the JMX Exporter configuration file
COPY jmx_exporter_config.yaml /app/jmx_exporter_config.yaml

# Run the application with the JMX Exporter agent
CMD ["java", "-javaagent:/app/jmx_prometheus_javaagent.jar=8080:/app/jmx_exporter_config.yaml", "-jar", "/app/app.jar"]