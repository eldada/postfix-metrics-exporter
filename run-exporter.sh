#!/bin/bash

# Startup script for the postfix_exporter
# Made to wait for the postfix log to appear to avoid crashing until log exists

POSTFIX_LOG=${POSTFIX_LOG:-/data/log/maillog}

while [ ! -f "${POSTFIX_LOG}" ]; do
    echo "Waiting for ${POSTFIX_LOG}"
    sleep 1
done

exec /bin/postfix_exporter --postfix.logfile_path "${POSTFIX_LOG}"
