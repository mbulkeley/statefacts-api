#!/usr/bin/env bash
#   Use this script to test if a given TCP host/port are available

# From https://github.com/vishnubob/wait-for-it (MIT License)

set -e

TIMEOUT=15
QUIET=0
STRICT=0

echoerr() { if [[ $QUIET -ne 1 ]]; then echo "$@" 1>&2; fi }

wait_for() {
  local HOST="$1"
  local PORT="$2"
  echo "⌛ Waiting for $HOST:$PORT..."

  for i in $(seq $TIMEOUT); do
    nc -z "$HOST" "$PORT" >/dev/null 2>&1 && break
    echoerr "⏳  $i... not yet"
    sleep 1
  done

  if nc -z "$HOST" "$PORT" >/dev/null 2>&1; then
    echo "✅ $HOST:$PORT is available"
  else
    echoerr "❌ Timeout after $TIMEOUT seconds while waiting for $HOST:$PORT"
    return 1
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --timeout=*) TIMEOUT="${1#*=}" ;;
    --strict) STRICT=1 ;;
    --quiet) QUIET=1 ;;
    --) shift; break ;;
    *) break ;;
  esac
  shift
done

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 host:port [-- command args...]"
  exit 1
fi

HOST_PORT="$1"
shift
HOST="${HOST_PORT%%:*}"
PORT="${HOST_PORT##*:}"

wait_for "$HOST" "$PORT"

RESULT=$?
if [[ $RESULT -ne 0 && $STRICT -eq 1 ]]; then
  exit $RESULT
fi

exec "$@"
