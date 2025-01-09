#!/bin/bash

set -e

TOMCAT_DIR="/opt/tomcat"

# Stop Tomcat
sudo $TOMCAT_DIR/bin/shutdown.sh || echo "Tomcat is not running."
echo "Tomcat stopped successfully."
