#!/bin/bash

# Set variables for the Tomcat service and application URL
TOMCAT_SERVICE="tomcat"  # This might be different depending on your system
TOMCAT_STATUS_URL="http://13.126.26.20:8080/health"  # Replace with your actual health check URL if available

# Function to check if Tomcat service is running
check_tomcat_service() {
    echo "Checking if Tomcat service is running..."
    if systemctl is-active --quiet $TOMCAT_SERVICE; then
        echo "Tomcat service is running."
    else
        echo "Tomcat service is not running."
        exit 1
    fi
}

# Function to check if the Tomcat application is accessible
check_application_access() {
    echo "Checking if the Tomcat application is accessible at $TOMCAT_STATUS_URL..."
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" $TOMCAT_STATUS_URL)
    
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Tomcat application is accessible. HTTP Code: $HTTP_CODE"
    else
        echo "Tomcat application is not accessible. HTTP Code: $HTTP_CODE"
        exit 1
    fi
}

# Run the health checks
check_tomcat_service
check_application_access

echo "Tomcat service deployment validated successfully."
