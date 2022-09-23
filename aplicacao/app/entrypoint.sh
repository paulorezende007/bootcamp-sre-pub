#!/bin/bash
export DD_LOGS_INJECTION=true;
export DD_APM_ENABLED=true;
export DD_PROCESS_AGENT_ENABLED=false;
service datadog-agent restart >/dev/null 2>&1;
ddtrace-run python /usr/src/app/app.py run -h 0.0.0.0;
while true; do
  sleep 3600;
  service datadog-agent stop;
  sleep 10;
  service datadog-agent start;  
done
sleep infinity;
exit 0;
