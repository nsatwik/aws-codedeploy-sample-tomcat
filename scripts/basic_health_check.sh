#!/bin/bash
# verify_application.sh
echo "Verifying application is running..."
curl -f http://localhost:8080/myapp/ || exit 1
